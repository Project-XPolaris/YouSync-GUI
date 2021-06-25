class ServiceInfoResponse {
  late String name;
  late bool success;

  ServiceInfoResponse({
      required this.name,
      required this.success});

  ServiceInfoResponse.fromJson(dynamic json) {
    name = json["name"];
    success = json["success"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["success"] = success;
    return map;
  }

}