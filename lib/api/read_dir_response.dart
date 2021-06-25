class ReadDirResponse {
  String? back;
  List<Files>? files;
  String? path;
  String? sep;

  ReadDirResponse({
      this.back, 
      this.files, 
      this.path, 
      this.sep});

  ReadDirResponse.fromJson(dynamic json) {
    back = json["back"];
    if (json["files"] != null) {
      files = [];
      json["files"].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
    path = json["path"];
    sep = json["sep"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["back"] = back;
    if (files != null) {
      map["files"] = files?.map((v) => v.toJson()).toList();
    }
    map["path"] = path;
    map["sep"] = sep;
    return map;
  }

}

class Files {
  String? type;
  String? name;
  String? path;

  Files({
      this.type, 
      this.name, 
      this.path});

  Files.fromJson(dynamic json) {
    type = json["type"];
    name = json["name"];
    path = json["path"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    map["name"] = name;
    map["path"] = path;
    return map;
  }

}