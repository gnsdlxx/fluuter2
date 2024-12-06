import 'package:exam1/utils/http/models/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<TestLoginModel> login(String email, String password) async {
  Map data = {"email": email, "password": password};

  http.Response response = await http
      .post(Uri.parse("http://3.27.120.15:8080/auth/login/"), body: data);
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return TestLoginModel.fromJson(
      json.decode(responseBody), response.statusCode);
}

Future<TestLoginModel> register(String email, String password, String nickname,
    String gender, String birthdate, String address) async {
  Map data = {
    "email": email,
    "password": password,
    "gender": gender,
    "birthdate": birthdate,
    "address": address,
    "nickname": nickname
  };

  http.Response response = await http
      .post(Uri.parse("http://3.27.120.15:8080/auth/signup/"), body: data);
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return TestLoginModel.fromJson(json.decode(responseBody), 0);
}
