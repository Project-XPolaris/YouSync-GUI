class BaseResponse {
  bool? success;
  String? reason;

  BaseResponse({
      this.success, 
      this.reason});

  BaseResponse.fromJson(dynamic json) {
    success = json["success"];
    reason = json["reason"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["reason"] = reason;
    return map;
  }

}