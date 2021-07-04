class SyncFolderResponse {
  int? id;
  String? name;
  String? path;

  SyncFolderResponse({this.id, this.name, this.path});

  SyncFolderResponse.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    path = json["path"];
  }
}
