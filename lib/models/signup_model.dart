import 'package:brota_ai_app/models/request_model.dart';

class SignUpResponseModel {
  final String token;
  final String error;

  SignUpResponseModel({required this.token, required this.error});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(token: json["token"] ?? "", error: json["message"] ?? "");
  }
}

class SignUpRequestModel implements RequestModel {
  String? name;
  String? cpf;
  String? email;
  String? password;
  String? confirmPassword;
  String? sex;
  DateTime? birthDate;

  SignUpRequestModel({
    this.email,
    this.password,
    this.confirmPassword,
    this.name,
    this.cpf,
    this.sex,
    this.birthDate
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'cpf': cpf,
      'email': email,
      'password': password,
      'sex': sex,
      'birthDate': birthDate?.toUtc().toString()
    };

    return map;
  }
}