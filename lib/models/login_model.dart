import 'base/request_model.dart';

class LoginResponseModel {
  final String token;
  final String message;

  LoginResponseModel({required this.token, required this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] ?? "", message: json["message"] ?? "");
  }
}

class LoginRequestModel implements RequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'email': email, 'password': password};
    return map;
  }
}
