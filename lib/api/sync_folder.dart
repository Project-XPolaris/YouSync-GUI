class SyncFolderResponse {
  int? id;
  String? name;

  SyncFolderResponse({
      this.id, 
      this.name});

  SyncFolderResponse.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}