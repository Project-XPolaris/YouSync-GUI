///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
export 'service.pb.dart';

class FileSyncClient extends $grpc.Client {
  static final _$checkChunk = $grpc.ClientMethod<$0.ChunkInfo, $0.CheckResult>(
      '/FileSync/CheckChunk',
      ($0.ChunkInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CheckResult.fromBuffer(value));
  static final _$syncFileChunk =
      $grpc.ClientMethod<$0.Chunk, $0.SyncChunkResult>(
          '/FileSync/SyncFileChunk',
          ($0.Chunk value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SyncChunkResult.fromBuffer(value));
  static final _$readFolderFiles =
      $grpc.ClientMethod<$0.RemoteFilesMessage, $0.RemoteFilesResult>(
          '/FileSync/ReadFolderFiles',
          ($0.RemoteFilesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RemoteFilesResult.fromBuffer(value));
  static final _$getRemoteFileChunkInfo =
      $grpc.ClientMethod<$0.GetRemoteChunkInfoMessage, $0.RemoteChunkInfo>(
          '/FileSync/GetRemoteFileChunkInfo',
          ($0.GetRemoteChunkInfoMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RemoteChunkInfo.fromBuffer(value));
  static final _$getRemoteFileChunk =
      $grpc.ClientMethod<$0.GetRemoteChunkMessage, $0.RemoteChunk>(
          '/FileSync/GetRemoteFileChunk',
          ($0.GetRemoteChunkMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RemoteChunk.fromBuffer(value));

  FileSyncClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CheckResult> checkChunk($0.ChunkInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkChunk, request, options: options);
  }

  $grpc.ResponseFuture<$0.SyncChunkResult> syncFileChunk($0.Chunk request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$syncFileChunk, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteFilesResult> readFolderFiles(
      $0.RemoteFilesMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$readFolderFiles, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteChunkInfo> getRemoteFileChunkInfo(
      $0.GetRemoteChunkInfoMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRemoteFileChunkInfo, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RemoteChunk> getRemoteFileChunk(
      $0.GetRemoteChunkMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRemoteFileChunk, request, options: options);
  }
}

abstract class FileSyncServiceBase extends $grpc.Service {
  $core.String get $name => 'FileSync';

  FileSyncServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChunkInfo, $0.CheckResult>(
        'CheckChunk',
        checkChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChunkInfo.fromBuffer(value),
        ($0.CheckResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Chunk, $0.SyncChunkResult>(
        'SyncFileChunk',
        syncFileChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Chunk.fromBuffer(value),
        ($0.SyncChunkResult value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoteFilesMessage, $0.RemoteFilesResult>(
        'ReadFolderFiles',
        readFolderFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoteFilesMessage.fromBuffer(value),
        ($0.RemoteFilesResult value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRemoteChunkInfoMessage, $0.RemoteChunkInfo>(
            'GetRemoteFileChunkInfo',
            getRemoteFileChunkInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetRemoteChunkInfoMessage.fromBuffer(value),
            ($0.RemoteChunkInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRemoteChunkMessage, $0.RemoteChunk>(
        'GetRemoteFileChunk',
        getRemoteFileChunk_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRemoteChunkMessage.fromBuffer(value),
        ($0.RemoteChunk value) => value.writeToBuffer()));
  }

  $async.Future<$0.CheckResult> checkChunk_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChunkInfo> request) async {
    return checkChunk(call, await request);
  }

  $async.Future<$0.SyncChunkResult> syncFileChunk_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Chunk> request) async {
    return syncFileChunk(call, await request);
  }

  $async.Future<$0.RemoteFilesResult> readFolderFiles_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RemoteFilesMessage> request) async {
    return readFolderFiles(call, await request);
  }

  $async.Future<$0.RemoteChunkInfo> getRemoteFileChunkInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRemoteChunkInfoMessage> request) async {
    return getRemoteFileChunkInfo(call, await request);
  }

  $async.Future<$0.RemoteChunk> getRemoteFileChunk_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetRemoteChunkMessage> request) async {
    return getRemoteFileChunk(call, await request);
  }

  $async.Future<$0.CheckResult> checkChunk(
      $grpc.ServiceCall call, $0.ChunkInfo request);
  $async.Future<$0.SyncChunkResult> syncFileChunk(
      $grpc.ServiceCall call, $0.Chunk request);
  $async.Future<$0.RemoteFilesResult> readFolderFiles(
      $grpc.ServiceCall call, $0.RemoteFilesMessage request);
  $async.Future<$0.RemoteChunkInfo> getRemoteFileChunkInfo(
      $grpc.ServiceCall call, $0.GetRemoteChunkInfoMessage request);
  $async.Future<$0.RemoteChunk> getRemoteFileChunk(
      $grpc.ServiceCall call, $0.GetRemoteChunkMessage request);
}
