class TestLoginModel {
  String? message;
  int? statusCode;
  String? token;

  TestLoginModel({
    this.message,
    this.statusCode,
    this.token,
  });

  factory TestLoginModel.fromJson(Map<String, dynamic> json, int statusCode) {
    return TestLoginModel(
        message: json["message"] ?? "",
        statusCode: statusCode,
        token: json["token"] ?? "");
  }
}
