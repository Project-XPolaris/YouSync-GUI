import 'package:dio/dio.dart';
import 'package:yousync/api/base_response.dart';
import 'package:yousync/api/read_dir_response.dart';
import 'package:yousync/api/sync_folder.dart';
import 'package:yousync/config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  static Dio _dio = new Dio();

  factory ApiClient() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.baseUrl = "http://${ApplicationConfig().serviceUrl}:4300" ;
      handler.next(options);
    }));
    return _instance;
  }
  Future<ReadDirResponse> readRemoteDir(String target)async {
    var response = await _dio.get("/explore/readdir",queryParameters: {
      "path":target
    });
    ReadDirResponse readDirResponse = ReadDirResponse.fromJson(response.data);
    return readDirResponse;
  }
  Future<SyncFolderResponse> createSyncFolder(String path) async {
    var response = await _dio.post("/sync/folder",data: {"path":path});
    return SyncFolderResponse.fromJson(response.data);
  }
  ApiClient._internal();
}
