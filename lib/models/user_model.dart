import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/models/signup_model.dart';

class UsersModel {
  String? name;
  String? cpf;
  String? email;
  String? password;
  DateTime? birthDate;

  UsersModel({this.name, this.cpf, this.email, this.birthDate, this.password});

  static UsersModel fromLoginRequestModel(LoginRequestModel model) {
    return UsersModel(email: model.email, password: model.password);
  }

  void fromSignUpRequestModel(SignUpRequestModel model) {
    email = model.email;
    password = model.password;
  }

  void fromGetLogged(UsersModel model) {
    name = model.name;
    cpf = model.cpf;
    email = model.email;
    birthDate = model.birthDate;
  }

  factory UsersModel.fromJson(dynamic json) {
    return UsersModel(
        name: json["name"] ?? "", cpf: json["cpf"] ?? "", email: json["email"]);
  }

  Map<String, String> toJson() {
    Map<String, String> map = {
      'name': name ?? "",
      'cpf': cpf ?? "",
      'email': email ?? "",
      'password': password ?? "",
      'birthDate': birthDate?.toUtc().toString() ?? ""
    };

    return map;
  }
}
