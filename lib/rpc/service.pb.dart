///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class BaseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BaseResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  BaseResponse._() : super();
  factory BaseResponse({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory BaseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseResponse clone() => BaseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseResponse copyWith(void Function(BaseResponse) updates) => super.copyWith((message) => updates(message as BaseResponse)) as BaseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BaseResponse create() => BaseResponse._();
  BaseResponse createEmptyInstance() => create();
  static $pb.PbList<BaseResponse> createRepeated() => $pb.PbList<BaseResponse>();
  @$core.pragma('dart2js:noInline')
  static BaseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseResponse>(create);
  static BaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ChunkInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChunkInfo', createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'checkSum', protoName: 'checkSum')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ChunkInfo._() : super();
  factory ChunkInfo({
    $fixnum.Int64? index,
    $fixnum.Int64? size,
    $fixnum.Int64? offset,
    $core.String? checkSum,
    $core.String? path,
    $fixnum.Int64? folderId,
  }) {
    final _result = create();
    if (index != null) {
      _result.index = index;
    }
    if (size != null) {
      _result.size = size;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (checkSum != null) {
      _result.checkSum = checkSum;
    }
    if (path != null) {
      _result.path = path;
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    return _result;
  }
  factory ChunkInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkInfo clone() => ChunkInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkInfo copyWith(void Function(ChunkInfo) updates) => super.copyWith((message) => updates(message as ChunkInfo)) as ChunkInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChunkInfo create() => ChunkInfo._();
  ChunkInfo createEmptyInstance() => create();
  static $pb.PbList<ChunkInfo> createRepeated() => $pb.PbList<ChunkInfo>();
  @$core.pragma('dart2js:noInline')
  static ChunkInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkInfo>(create);
  static ChunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get index => $_getI64(0);
  @$pb.TagNumber(1)
  set index($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offset => $_getI64(2);
  @$pb.TagNumber(3)
  set offset($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get checkSum => $_getSZ(3);
  @$pb.TagNumber(4)
  set checkSum($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCheckSum() => $_has(3);
  @$pb.TagNumber(4)
  void clearCheckSum() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get path => $_getSZ(4);
  @$pb.TagNumber(5)
  set path($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearPath() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get folderId => $_getI64(5);
  @$pb.TagNumber(6)
  set folderId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFolderId() => $_has(5);
  @$pb.TagNumber(6)
  void clearFolderId() => clearField(6);
}

class CheckResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckResult', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CheckResult._() : super();
  factory CheckResult({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CheckResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckResult clone() => CheckResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckResult copyWith(void Function(CheckResult) updates) => super.copyWith((message) => updates(message as CheckResult)) as CheckResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckResult create() => CheckResult._();
  CheckResult createEmptyInstance() => create();
  static $pb.PbList<CheckResult> createRepeated() => $pb.PbList<CheckResult>();
  @$core.pragma('dart2js:noInline')
  static CheckResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckResult>(create);
  static CheckResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class Chunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Chunk', createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'LastChunk', protoName: 'LastChunk')
    ..a<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Chunk._() : super();
  factory Chunk({
    $fixnum.Int64? index,
    $fixnum.Int64? size,
    $fixnum.Int64? offset,
    $core.String? path,
    $fixnum.Int64? folderId,
    $core.bool? lastChunk,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (index != null) {
      _result.index = index;
    }
    if (size != null) {
      _result.size = size;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (path != null) {
      _result.path = path;
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    if (lastChunk != null) {
      _result.lastChunk = lastChunk;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory Chunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chunk clone() => Chunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chunk copyWith(void Function(Chunk) updates) => super.copyWith((message) => updates(message as Chunk)) as Chunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chunk create() => Chunk._();
  Chunk createEmptyInstance() => create();
  static $pb.PbList<Chunk> createRepeated() => $pb.PbList<Chunk>();
  @$core.pragma('dart2js:noInline')
  static Chunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chunk>(create);
  static Chunk? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get index => $_getI64(0);
  @$pb.TagNumber(1)
  set index($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offset => $_getI64(2);
  @$pb.TagNumber(3)
  set offset($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get path => $_getSZ(3);
  @$pb.TagNumber(4)
  set path($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearPath() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get folderId => $_getI64(4);
  @$pb.TagNumber(5)
  set folderId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFolderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFolderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get lastChunk => $_getBF(5);
  @$pb.TagNumber(6)
  set lastChunk($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastChunk() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastChunk() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get data => $_getN(6);
  @$pb.TagNumber(7)
  set data($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasData() => $_has(6);
  @$pb.TagNumber(7)
  void clearData() => clearField(7);
}

class SyncChunkResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncChunkResult', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  SyncChunkResult._() : super();
  factory SyncChunkResult({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory SyncChunkResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncChunkResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncChunkResult clone() => SyncChunkResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncChunkResult copyWith(void Function(SyncChunkResult) updates) => super.copyWith((message) => updates(message as SyncChunkResult)) as SyncChunkResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncChunkResult create() => SyncChunkResult._();
  SyncChunkResult createEmptyInstance() => create();
  static $pb.PbList<SyncChunkResult> createRepeated() => $pb.PbList<SyncChunkResult>();
  @$core.pragma('dart2js:noInline')
  static SyncChunkResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncChunkResult>(create);
  static SyncChunkResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RemoteFiles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteFiles', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  RemoteFiles._() : super();
  factory RemoteFiles({
    $core.String? path,
    $fixnum.Int64? folderId,
    $fixnum.Int64? size,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    if (size != null) {
      _result.size = size;
    }
    return _result;
  }
  factory RemoteFiles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteFiles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteFiles clone() => RemoteFiles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteFiles copyWith(void Function(RemoteFiles) updates) => super.copyWith((message) => updates(message as RemoteFiles)) as RemoteFiles; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteFiles create() => RemoteFiles._();
  RemoteFiles createEmptyInstance() => create();
  static $pb.PbList<RemoteFiles> createRepeated() => $pb.PbList<RemoteFiles>();
  @$core.pragma('dart2js:noInline')
  static RemoteFiles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteFiles>(create);
  static RemoteFiles? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get folderId => $_getI64(1);
  @$pb.TagNumber(2)
  set folderId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);
}

class RemoteFilesResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteFilesResult', createEmptyInstance: create)
    ..pc<RemoteFiles>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'files', $pb.PbFieldType.PM, subBuilder: RemoteFiles.create)
    ..hasRequiredFields = false
  ;

  RemoteFilesResult._() : super();
  factory RemoteFilesResult({
    $core.Iterable<RemoteFiles>? files,
  }) {
    final _result = create();
    if (files != null) {
      _result.files.addAll(files);
    }
    return _result;
  }
  factory RemoteFilesResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteFilesResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteFilesResult clone() => RemoteFilesResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteFilesResult copyWith(void Function(RemoteFilesResult) updates) => super.copyWith((message) => updates(message as RemoteFilesResult)) as RemoteFilesResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteFilesResult create() => RemoteFilesResult._();
  RemoteFilesResult createEmptyInstance() => create();
  static $pb.PbList<RemoteFilesResult> createRepeated() => $pb.PbList<RemoteFilesResult>();
  @$core.pragma('dart2js:noInline')
  static RemoteFilesResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteFilesResult>(create);
  static RemoteFilesResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RemoteFiles> get files => $_getList(0);
}

class RemoteFilesMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteFilesMessage', createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  RemoteFilesMessage._() : super();
  factory RemoteFilesMessage({
    $fixnum.Int64? folderId,
  }) {
    final _result = create();
    if (folderId != null) {
      _result.folderId = folderId;
    }
    return _result;
  }
  factory RemoteFilesMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteFilesMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteFilesMessage clone() => RemoteFilesMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteFilesMessage copyWith(void Function(RemoteFilesMessage) updates) => super.copyWith((message) => updates(message as RemoteFilesMessage)) as RemoteFilesMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteFilesMessage create() => RemoteFilesMessage._();
  RemoteFilesMessage createEmptyInstance() => create();
  static $pb.PbList<RemoteFilesMessage> createRepeated() => $pb.PbList<RemoteFilesMessage>();
  @$core.pragma('dart2js:noInline')
  static RemoteFilesMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteFilesMessage>(create);
  static RemoteFilesMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get folderId => $_getI64(0);
  @$pb.TagNumber(1)
  set folderId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFolderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFolderId() => clearField(1);
}

class GetRemoteChunkInfoMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRemoteChunkInfoMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetRemoteChunkInfoMessage._() : super();
  factory GetRemoteChunkInfoMessage({
    $core.String? path,
    $fixnum.Int64? folderId,
    $fixnum.Int64? size,
    $fixnum.Int64? offset,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    if (size != null) {
      _result.size = size;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory GetRemoteChunkInfoMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRemoteChunkInfoMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRemoteChunkInfoMessage clone() => GetRemoteChunkInfoMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRemoteChunkInfoMessage copyWith(void Function(GetRemoteChunkInfoMessage) updates) => super.copyWith((message) => updates(message as GetRemoteChunkInfoMessage)) as GetRemoteChunkInfoMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRemoteChunkInfoMessage create() => GetRemoteChunkInfoMessage._();
  GetRemoteChunkInfoMessage createEmptyInstance() => create();
  static $pb.PbList<GetRemoteChunkInfoMessage> createRepeated() => $pb.PbList<GetRemoteChunkInfoMessage>();
  @$core.pragma('dart2js:noInline')
  static GetRemoteChunkInfoMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRemoteChunkInfoMessage>(create);
  static GetRemoteChunkInfoMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get folderId => $_getI64(1);
  @$pb.TagNumber(2)
  set folderId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFolderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFolderId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get offset => $_getI64(3);
  @$pb.TagNumber(4)
  set offset($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOffset() => $_has(3);
  @$pb.TagNumber(4)
  void clearOffset() => clearField(4);
}

class RemoteChunkInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteChunkInfo', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'LastChunk', protoName: 'LastChunk')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Checksum', protoName: 'Checksum')
    ..hasRequiredFields = false
  ;

  RemoteChunkInfo._() : super();
  factory RemoteChunkInfo({
    $core.bool? lastChunk,
    $core.String? checksum,
  }) {
    final _result = create();
    if (lastChunk != null) {
      _result.lastChunk = lastChunk;
    }
    if (checksum != null) {
      _result.checksum = checksum;
    }
    return _result;
  }
  factory RemoteChunkInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteChunkInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteChunkInfo clone() => RemoteChunkInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteChunkInfo copyWith(void Function(RemoteChunkInfo) updates) => super.copyWith((message) => updates(message as RemoteChunkInfo)) as RemoteChunkInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteChunkInfo create() => RemoteChunkInfo._();
  RemoteChunkInfo createEmptyInstance() => create();
  static $pb.PbList<RemoteChunkInfo> createRepeated() => $pb.PbList<RemoteChunkInfo>();
  @$core.pragma('dart2js:noInline')
  static RemoteChunkInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteChunkInfo>(create);
  static RemoteChunkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get lastChunk => $_getBF(0);
  @$pb.TagNumber(1)
  set lastChunk($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastChunk() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get checksum => $_getSZ(1);
  @$pb.TagNumber(2)
  set checksum($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChecksum() => $_has(1);
  @$pb.TagNumber(2)
  void clearChecksum() => clearField(2);
}

class GetRemoteChunkMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetRemoteChunkMessage', createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetRemoteChunkMessage._() : super();
  factory GetRemoteChunkMessage({
    $fixnum.Int64? size,
    $fixnum.Int64? offset,
    $core.String? path,
    $fixnum.Int64? folderId,
  }) {
    final _result = create();
    if (size != null) {
      _result.size = size;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (path != null) {
      _result.path = path;
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    return _result;
  }
  factory GetRemoteChunkMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRemoteChunkMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRemoteChunkMessage clone() => GetRemoteChunkMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRemoteChunkMessage copyWith(void Function(GetRemoteChunkMessage) updates) => super.copyWith((message) => updates(message as GetRemoteChunkMessage)) as GetRemoteChunkMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetRemoteChunkMessage create() => GetRemoteChunkMessage._();
  GetRemoteChunkMessage createEmptyInstance() => create();
  static $pb.PbList<GetRemoteChunkMessage> createRepeated() => $pb.PbList<GetRemoteChunkMessage>();
  @$core.pragma('dart2js:noInline')
  static GetRemoteChunkMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRemoteChunkMessage>(create);
  static GetRemoteChunkMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get size => $_getI64(0);
  @$pb.TagNumber(1)
  set size($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get folderId => $_getI64(3);
  @$pb.TagNumber(4)
  set folderId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFolderId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFolderId() => clearField(4);
}

class RemoteChunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteChunk', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  RemoteChunk._() : super();
  factory RemoteChunk({
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RemoteChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteChunk clone() => RemoteChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteChunk copyWith(void Function(RemoteChunk) updates) => super.copyWith((message) => updates(message as RemoteChunk)) as RemoteChunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteChunk create() => RemoteChunk._();
  RemoteChunk createEmptyInstance() => create();
  static $pb.PbList<RemoteChunk> createRepeated() => $pb.PbList<RemoteChunk>();
  @$core.pragma('dart2js:noInline')
  static RemoteChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteChunk>(create);
  static RemoteChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class SyncFileItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncFileItem', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'path')
    ..hasRequiredFields = false
  ;

  SyncFileItem._() : super();
  factory SyncFileItem({
    $core.String? path,
  }) {
    final _result = create();
    if (path != null) {
      _result.path = path;
    }
    return _result;
  }
  factory SyncFileItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncFileItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncFileItem clone() => SyncFileItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncFileItem copyWith(void Function(SyncFileItem) updates) => super.copyWith((message) => updates(message as SyncFileItem)) as SyncFileItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncFileItem create() => SyncFileItem._();
  SyncFileItem createEmptyInstance() => create();
  static $pb.PbList<SyncFileItem> createRepeated() => $pb.PbList<SyncFileItem>();
  @$core.pragma('dart2js:noInline')
  static SyncFileItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncFileItem>(create);
  static SyncFileItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class SyncFileListMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncFileListMessage', createEmptyInstance: create)
    ..pc<SyncFileItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folder', $pb.PbFieldType.PM, subBuilder: SyncFileItem.create)
    ..pc<SyncFileItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'file', $pb.PbFieldType.PM, subBuilder: SyncFileItem.create)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'folderId', $pb.PbFieldType.OU6, protoName: 'folderId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  SyncFileListMessage._() : super();
  factory SyncFileListMessage({
    $core.Iterable<SyncFileItem>? folder,
    $core.Iterable<SyncFileItem>? file,
    $fixnum.Int64? folderId,
  }) {
    final _result = create();
    if (folder != null) {
      _result.folder.addAll(folder);
    }
    if (file != null) {
      _result.file.addAll(file);
    }
    if (folderId != null) {
      _result.folderId = folderId;
    }
    return _result;
  }
  factory SyncFileListMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncFileListMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncFileListMessage clone() => SyncFileListMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncFileListMessage copyWith(void Function(SyncFileListMessage) updates) => super.copyWith((message) => updates(message as SyncFileListMessage)) as SyncFileListMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncFileListMessage create() => SyncFileListMessage._();
  SyncFileListMessage createEmptyInstance() => create();
  static $pb.PbList<SyncFileListMessage> createRepeated() => $pb.PbList<SyncFileListMessage>();
  @$core.pragma('dart2js:noInline')
  static SyncFileListMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncFileListMessage>(create);
  static SyncFileListMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SyncFileItem> get folder => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<SyncFileItem> get file => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get folderId => $_getI64(2);
  @$pb.TagNumber(3)
  set folderId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFolderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFolderId() => clearField(3);
}

