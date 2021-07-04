class UserAuth {
  late bool success;
  late String token;
  late String uid;

  UserAuth({
      required this.success,
      required this.token,
      required this.uid});

  UserAuth.fromJson(dynamic json) {
    success = json["success"];
    token = json["token"];
    uid = json["uid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["token"] = token;
    map["uid"] = uid;
    return map;
  }

}