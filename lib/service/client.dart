import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:grpc/grpc.dart';
import 'package:yousync/rpc/service.pbgrpc.dart';
import 'package:path/path.dart' as p;
SyncClient DefaultSyncClient = new SyncClient();
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

  Future<void> syncFolder(String dirPath,int remoteFolderId) async {
    Directory dir = new Directory(dirPath);
    await for (var item in dir.list(recursive: true)) {
      var stat = await item.stat();
      if (stat.type == FileSystemEntityType.directory) {
        continue;
      }
      await syncFile(item.path,dirPath,remoteFolderId);
    }
  }

  Future<void> syncFile(String filePath, String rootPath,int remoteFolderId) async {
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
}
