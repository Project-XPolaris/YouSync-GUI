class UserToken {
  late bool success;
  late String uid;
  late String username;

  UserToken({
      required this.success,
      required this.uid,
      required this.username});

  UserToken.fromJson(dynamic json) {
    success = json["success"];
    uid = json["uid"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["uid"] = uid;
    map["username"] = username;
    return map;
  }

}