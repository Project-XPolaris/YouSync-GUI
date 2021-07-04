class ServiceInfoResponse {
  late String name;
  late bool success;
  late bool auth;

  ServiceInfoResponse({
      required this.name,
      required this.success,required this.auth});

  ServiceInfoResponse.fromJson(dynamic json) {
    name = json["name"];
    success = json["success"];
    auth = json["auth"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["success"] = success;
    map["auth"] = auth;
    return map;
  }

}