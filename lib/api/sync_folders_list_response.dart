class SyncFoldersListResponse {
  int? page;
  int? pageSize;
  List<RemoteSyncFolder>? result;
  bool? success;

  SyncFoldersListResponse({
      this.page, 
      this.pageSize, 
      this.result, 
      this.success});

  SyncFoldersListResponse.fromJson(dynamic json) {
    page = json["page"];
    pageSize = json["pageSize"];
    if (json["result"] != null) {
      result = [];
      json["result"].forEach((v) {
        result?.add(RemoteSyncFolder.fromJson(v));
      });
    }
    success = json["success"];
  }
}

class RemoteSyncFolder {
  int? id;
  String? name;
  String? path;

  RemoteSyncFolder({
      this.id, 
      this.name,this.path});

  RemoteSyncFolder.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    path = json['path'];
  }

}