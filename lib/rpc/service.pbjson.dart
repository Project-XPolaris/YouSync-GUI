///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use baseResponseDescriptor instead')
const BaseResponse$json = const {
  '1': 'BaseResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `BaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseResponseDescriptor = $convert.base64Decode('CgxCYXNlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use chunkInfoDescriptor instead')
const ChunkInfo$json = const {
  '1': 'ChunkInfo',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 4, '10': 'index'},
    const {'1': 'size', '3': 2, '4': 1, '5': 4, '10': 'size'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 4, '10': 'offset'},
    const {'1': 'checkSum', '3': 4, '4': 1, '5': 9, '10': 'checkSum'},
    const {'1': 'path', '3': 5, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'folderId', '3': 6, '4': 1, '5': 4, '10': 'folderId'},
  ],
};

/// Descriptor for `ChunkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkInfoDescriptor = $convert.base64Decode('CglDaHVua0luZm8SFAoFaW5kZXgYASABKARSBWluZGV4EhIKBHNpemUYAiABKARSBHNpemUSFgoGb2Zmc2V0GAMgASgEUgZvZmZzZXQSGgoIY2hlY2tTdW0YBCABKAlSCGNoZWNrU3VtEhIKBHBhdGgYBSABKAlSBHBhdGgSGgoIZm9sZGVySWQYBiABKARSCGZvbGRlcklk');
@$core.Deprecated('Use checkResultDescriptor instead')
const CheckResult$json = const {
  '1': 'CheckResult',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CheckResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkResultDescriptor = $convert.base64Decode('CgtDaGVja1Jlc3VsdBIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 4, '10': 'index'},
    const {'1': 'size', '3': 2, '4': 1, '5': 4, '10': 'size'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 4, '10': 'offset'},
    const {'1': 'path', '3': 4, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'folderId', '3': 5, '4': 1, '5': 4, '10': 'folderId'},
    const {'1': 'LastChunk', '3': 6, '4': 1, '5': 8, '10': 'LastChunk'},
    const {'1': 'data', '3': 7, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIUCgVpbmRleBgBIAEoBFIFaW5kZXgSEgoEc2l6ZRgCIAEoBFIEc2l6ZRIWCgZvZmZzZXQYAyABKARSBm9mZnNldBISCgRwYXRoGAQgASgJUgRwYXRoEhoKCGZvbGRlcklkGAUgASgEUghmb2xkZXJJZBIcCglMYXN0Q2h1bmsYBiABKAhSCUxhc3RDaHVuaxISCgRkYXRhGAcgASgMUgRkYXRh');
@$core.Deprecated('Use syncChunkResultDescriptor instead')
const SyncChunkResult$json = const {
  '1': 'SyncChunkResult',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SyncChunkResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncChunkResultDescriptor = $convert.base64Decode('Cg9TeW5jQ2h1bmtSZXN1bHQSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use remoteFilesDescriptor instead')
const RemoteFiles$json = const {
  '1': 'RemoteFiles',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'folderId', '3': 2, '4': 1, '5': 4, '10': 'folderId'},
    const {'1': 'size', '3': 3, '4': 1, '5': 4, '10': 'size'},
  ],
};

/// Descriptor for `RemoteFiles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteFilesDescriptor = $convert.base64Decode('CgtSZW1vdGVGaWxlcxISCgRwYXRoGAEgASgJUgRwYXRoEhoKCGZvbGRlcklkGAIgASgEUghmb2xkZXJJZBISCgRzaXplGAMgASgEUgRzaXpl');
@$core.Deprecated('Use remoteFilesResultDescriptor instead')
const RemoteFilesResult$json = const {
  '1': 'RemoteFilesResult',
  '2': const [
    const {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.RemoteFiles', '10': 'files'},
  ],
};

/// Descriptor for `RemoteFilesResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteFilesResultDescriptor = $convert.base64Decode('ChFSZW1vdGVGaWxlc1Jlc3VsdBIiCgVmaWxlcxgBIAMoCzIMLlJlbW90ZUZpbGVzUgVmaWxlcw==');
@$core.Deprecated('Use remoteFilesMessageDescriptor instead')
const RemoteFilesMessage$json = const {
  '1': 'RemoteFilesMessage',
  '2': const [
    const {'1': 'folderId', '3': 1, '4': 1, '5': 4, '10': 'folderId'},
  ],
};

/// Descriptor for `RemoteFilesMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteFilesMessageDescriptor = $convert.base64Decode('ChJSZW1vdGVGaWxlc01lc3NhZ2USGgoIZm9sZGVySWQYASABKARSCGZvbGRlcklk');
@$core.Deprecated('Use getRemoteChunkInfoMessageDescriptor instead')
const GetRemoteChunkInfoMessage$json = const {
  '1': 'GetRemoteChunkInfoMessage',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'folderId', '3': 2, '4': 1, '5': 4, '10': 'folderId'},
    const {'1': 'size', '3': 3, '4': 1, '5': 4, '10': 'size'},
    const {'1': 'offset', '3': 4, '4': 1, '5': 4, '10': 'offset'},
  ],
};

/// Descriptor for `GetRemoteChunkInfoMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteChunkInfoMessageDescriptor = $convert.base64Decode('ChlHZXRSZW1vdGVDaHVua0luZm9NZXNzYWdlEhIKBHBhdGgYASABKAlSBHBhdGgSGgoIZm9sZGVySWQYAiABKARSCGZvbGRlcklkEhIKBHNpemUYAyABKARSBHNpemUSFgoGb2Zmc2V0GAQgASgEUgZvZmZzZXQ=');
@$core.Deprecated('Use remoteChunkInfoDescriptor instead')
const RemoteChunkInfo$json = const {
  '1': 'RemoteChunkInfo',
  '2': const [
    const {'1': 'LastChunk', '3': 1, '4': 1, '5': 8, '10': 'LastChunk'},
    const {'1': 'Checksum', '3': 2, '4': 1, '5': 9, '10': 'Checksum'},
  ],
};

/// Descriptor for `RemoteChunkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteChunkInfoDescriptor = $convert.base64Decode('Cg9SZW1vdGVDaHVua0luZm8SHAoJTGFzdENodW5rGAEgASgIUglMYXN0Q2h1bmsSGgoIQ2hlY2tzdW0YAiABKAlSCENoZWNrc3Vt');
@$core.Deprecated('Use getRemoteChunkMessageDescriptor instead')
const GetRemoteChunkMessage$json = const {
  '1': 'GetRemoteChunkMessage',
  '2': const [
    const {'1': 'size', '3': 1, '4': 1, '5': 4, '10': 'size'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 4, '10': 'offset'},
    const {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'folderId', '3': 4, '4': 1, '5': 4, '10': 'folderId'},
  ],
};

/// Descriptor for `GetRemoteChunkMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteChunkMessageDescriptor = $convert.base64Decode('ChVHZXRSZW1vdGVDaHVua01lc3NhZ2USEgoEc2l6ZRgBIAEoBFIEc2l6ZRIWCgZvZmZzZXQYAiABKARSBm9mZnNldBISCgRwYXRoGAMgASgJUgRwYXRoEhoKCGZvbGRlcklkGAQgASgEUghmb2xkZXJJZA==');
@$core.Deprecated('Use remoteChunkDescriptor instead')
const RemoteChunk$json = const {
  '1': 'RemoteChunk',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `RemoteChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteChunkDescriptor = $convert.base64Decode('CgtSZW1vdGVDaHVuaxISCgRkYXRhGAEgASgMUgRkYXRh');
@$core.Deprecated('Use syncFileItemDescriptor instead')
const SyncFileItem$json = const {
  '1': 'SyncFileItem',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `SyncFileItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncFileItemDescriptor = $convert.base64Decode('CgxTeW5jRmlsZUl0ZW0SEgoEcGF0aBgBIAEoCVIEcGF0aA==');
@$core.Deprecated('Use syncFileListMessageDescriptor instead')
const SyncFileListMessage$json = const {
  '1': 'SyncFileListMessage',
  '2': const [
    const {'1': 'folder', '3': 1, '4': 3, '5': 11, '6': '.SyncFileItem', '10': 'folder'},
    const {'1': 'file', '3': 2, '4': 3, '5': 11, '6': '.SyncFileItem', '10': 'file'},
    const {'1': 'folderId', '3': 3, '4': 1, '5': 4, '10': 'folderId'},
  ],
};

/// Descriptor for `SyncFileListMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncFileListMessageDescriptor = $convert.base64Decode('ChNTeW5jRmlsZUxpc3RNZXNzYWdlEiUKBmZvbGRlchgBIAMoCzINLlN5bmNGaWxlSXRlbVIGZm9sZGVyEiEKBGZpbGUYAiADKAsyDS5TeW5jRmlsZUl0ZW1SBGZpbGUSGgoIZm9sZGVySWQYAyABKARSCGZvbGRlcklk');
