import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:grpc/grpc.dart';
import 'package:yousync/rpc/service.pbgrpc.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as io;

SyncClient DefaultSyncClient = new SyncClient();

class SyncFileStatus {
  final String path;
  final int chunk;
  final int totalChunk;

  SyncFileStatus(
      {required this.path, required this.chunk, required this.totalChunk});
}

class SyncFolderStatus {
  SyncFileStatus file;

  SyncFolderStatus(this.file);
}

class PullFileStatus {
  final String path;
  final int chunk;
  final int totalChunk;

  PullFileStatus(
      {required this.path, required this.chunk, required this.totalChunk});
}

class PullFolderStatus {
  PullFileStatus file;

  PullFolderStatus(this.file);
}

class SyncClient {
  int maxChunkSize = 1000 * 1000;
  ClientChannel? channel;
  FileSyncClient? stub;

  Future<void> connect(String host) async {
    var stubChannel = ClientChannel(host,
        port: 50051,
        options: // No credentials in this example
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    var clientStub = FileSyncClient(stubChannel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    this.channel = stubChannel;
    this.stub = clientStub;
  }

  Future<void> syncFolder(String dirPath, int remoteFolderId,
      {Function(SyncFolderStatus)? onRefresh}) async {
    Directory dir = new Directory(dirPath);
    await for (var item in dir.list(recursive: true)) {
      var stat = await item.stat();
      if (stat.type == FileSystemEntityType.directory) {
        continue;
      }
      await syncFile(item.path, dirPath, remoteFolderId, (status) {
        if (onRefresh != null) {
          onRefresh(SyncFolderStatus(status));
        }
      });
    }
  }

  Future<void> syncFile(String filePath, String rootPath, int remoteFolderId,
      Function(SyncFileStatus) onRefresh) async {
    var instance = stub;
    if (instance == null) {
      return;
    }
    var relPath = filePath.replaceAll(rootPath, "");
    File file = new File(filePath);
    int length = await file.length();
    int chunkCount = (length / maxChunkSize).ceil();
    RandomAccessFile raf = file.openSync(mode: FileMode.read);
    for (int idx = 0; idx < chunkCount; idx++) {
      onRefresh(
          SyncFileStatus(path: filePath, chunk: idx, totalChunk: chunkCount));
      raf.setPositionSync(idx * maxChunkSize);
      Uint8List data = raf.readSync(maxChunkSize);
      Digest sha256Result = sha256.convert(data);
      var result = await instance.checkChunk(ChunkInfo(
          index: fixnum.Int64.parseInt(idx.toString()),
          size: fixnum.Int64.parseInt(data.length.toString()),
          offset: fixnum.Int64.parseInt((idx * maxChunkSize).toString()),
          checkSum: sha256Result.toString(),
          path: relPath,
          folderId: fixnum.Int64.parseInt(remoteFolderId.toString())));
      if (result.success) {
        continue;
      }
      await instance.syncFileChunk(Chunk(
        index: fixnum.Int64.parseInt(idx.toString()),
        size: fixnum.Int64.parseInt(data.length.toString()),
        offset: fixnum.Int64.parseInt((idx * maxChunkSize).toString()),
        path: relPath,
        folderId: fixnum.Int64.parseInt(remoteFolderId.toString()),
        lastChunk: data.length <= maxChunkSize,
        data: data,
      ));
    }
  }

  Future<void> checkChunk() async {
    var instance = stub;
    if (instance == null) {
      return;
    }
  }

  Future<List<RemoteFiles>> getRemoteFileList(int folderId) async {
    var instance = stub;
    if (instance == null) {
      return [];
    }
    var result = await instance.readFolderFiles(RemoteFilesMessage(
      folderId: fixnum.Int64.parseInt(folderId.toString()),
    ));
    return result.files;
  }

  Future<RemoteChunkInfo> getRemoteChunkInfo(
      RemoteFiles remoteFiles, int size, int offset) async {
    var instance = stub;
    if (instance == null) {
      throw Exception("client not connect");
    }
    return await instance.getRemoteFileChunkInfo(GetRemoteChunkInfoMessage(
        folderId: remoteFiles.folderId,
        offset: fixnum.Int64.parseInt(offset.toString()),
        size: fixnum.Int64.parseInt(size.toString()),
        path: remoteFiles.path));
  }

  Future<RemoteChunk> getRemoteChunk(
      RemoteFiles remoteFiles, int size, int offset) async {
    var instance = stub;
    if (instance == null) {
      throw Exception("client not connect");
    }
    return await instance.getRemoteFileChunk(GetRemoteChunkMessage(
        folderId: remoteFiles.folderId,
        offset: fixnum.Int64.parseInt(offset.toString()),
        size: fixnum.Int64.parseInt(size.toString()),
        path: remoteFiles.path));
  }

  Future pull(String pullPath, int folderId,
      {Function(PullFolderStatus status)? onUpdate}) async {
    var instance = stub;
    if (instance == null) {
      throw Exception("client not connect");
    }
    var result = await getRemoteFileList(folderId);
    var maxSyncSize = 1024 * 1024;
    for (int idx = 0; idx < result.length; idx++) {
      var remoteFile = result[idx];
      if (onUpdate != null) {
        onUpdate(PullFolderStatus(PullFileStatus(
            path: remoteFile.path,
            chunk: 0,
            totalChunk: (remoteFile.size.toInt() / maxChunkSize).ceil())));
      }
      String filePath = p.join(pullPath, remoteFile.path);
      String fileDir = p.dirname(filePath);
      new Directory(fileDir).createSync(recursive: true);
      var fileExist = io.File(filePath).existsSync();
      File file = new File(filePath);
      if (!fileExist) {
        RandomAccessFile raf = file.openSync(mode: FileMode.writeOnlyAppend);
        bool isEnd = false;
        int offset = 0;

        while (!isEnd) {
          if (onUpdate != null) {
            onUpdate(PullFolderStatus(PullFileStatus(
                path: remoteFile.path,
                chunk: (offset ~/ maxChunkSize) + 1,
                totalChunk: (remoteFile.size.toInt() / maxChunkSize).ceil())));
          }
          var info = await getRemoteChunkInfo(result[idx], maxSyncSize, offset);
          var chunk = await getRemoteChunk(result[idx], maxSyncSize, offset);
          raf.writeFromSync(chunk.data);
          offset += maxSyncSize;
          isEnd = info.lastChunk;
        }
        raf.closeSync();
        continue;
      }
      // sync with chunk
      bool isEnd = false;
      int offset = 0;
      while (!isEnd) {
        if (onUpdate != null) {
          onUpdate(PullFolderStatus(PullFileStatus(
              path: remoteFile.path,
              chunk: (offset ~/ maxChunkSize) + 1,
              totalChunk: (remoteFile.size.toInt() / maxChunkSize).ceil())));
        }
        RandomAccessFile raf = file.openSync(mode: FileMode.read);
        var info = await getRemoteChunkInfo(result[idx], maxSyncSize, offset);
        raf.setPositionSync(offset);
        Uint8List data = raf.readSync(maxSyncSize);
        Digest sha256Result = sha256.convert(data);
        if (!(sha256Result.toString() == info.checksum)) {
          raf.closeSync();
          raf = file.openSync(mode: FileMode.writeOnlyAppend);
          raf.setPositionSync(offset);
          var chunk = await getRemoteChunk(result[idx], maxSyncSize, offset);
          raf.writeFromSync(chunk.data);
        }
        offset += maxSyncSize;
        isEnd = info.lastChunk;
        raf.closeSync();
      }
      RandomAccessFile raf = file.openSync(mode: FileMode.writeOnlyAppend);
      raf.truncateSync(remoteFile.size.toInt());
      raf.close();
    }
  }
}
