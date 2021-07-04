import 'package:dio/dio.dart';
import 'package:yousync/api/read_dir_response.dart';
import 'package:yousync/api/service_info_response.dart';
import 'package:yousync/api/sync_folders_list_response.dart';
import 'package:yousync/api/sync_folder.dart';
import 'package:yousync/api/user_auth.dart';
import 'package:yousync/api/user_token.dart';
import 'package:yousync/config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  static Dio _dio = new Dio();

  factory ApiClient() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.baseUrl = "http://${ApplicationConfig().serviceUrl}:4300" ;
      var token = ApplicationConfig().token;
      if (token != null) {
        options.headers = {
          "Authorization":"Bearer $token"
        };
      }
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
  Future<SyncFolderResponse> removeSyncFolder(int id) async {
    var response = await _dio.delete("/sync/folder/$id");
    return SyncFolderResponse.fromJson(response.data);
  }
  Future<SyncFoldersListResponse> remoteSyncFolderList() async {
    var response = await _dio.get("/sync/folder");
    return SyncFoldersListResponse.fromJson(response.data);
  }
  Future<ServiceInfoResponse> fetchServiceInfo() async {
    var response = await _dio.get("/info");
    return ServiceInfoResponse.fromJson(response.data);
  }
  Future<UserAuth> userAuth(String username,String password) async {
    var response = await _dio.post("/user/auth",data: {"username":username,"password":password});
    print(response.data);
    return UserAuth.fromJson(response.data);
  }
  Future<UserToken> userToken(String token) async {
    var response = await _dio.get("/user/auth",queryParameters: {"token":token});
    return UserToken.fromJson(response.data);
  }

  ApiClient._internal();
}
