import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/models/signup_model.dart';

class UsersModel {
  String? id;
  String? name;
  String? cpf;
  String? email;
  String? password;
  String? gender;
  DateTime? birthDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  UsersModel({this.id, this.name, this.cpf, this.email, this.birthDate, this.password, this.gender, this.createdAt, this.updatedAt});

  static UsersModel fromLoginRequestModel(LoginRequestModel model) {
    return UsersModel(email: model.email, password: model.password);
  }

  void fromSignUpRequestModel(SignUpRequestModel model) {
    email = model.email;
    password = model.password;
  }

  void fromGetLogged(UsersModel model) {
    id = model.id;
    name = model.name;
    cpf = model.cpf;
    email = model.email;
    password = model.password;
    gender = model.gender;
    birthDate = DateTime.parse(model.birthDate as String);
    createdAt = DateTime.parse(model.createdAt as String);
    updatedAt = DateTime.parse(model.updatedAt as String);
  }

  factory UsersModel.fromJson(dynamic json) {
    return UsersModel(
        name: json["name"] ?? "",
        cpf: json["cpf"] ?? "",
        email: json["email"] ?? "",
        gender: json["gender"] ?? "",
        id: json["id"] ?? "",
        password: json["password"] ?? "",
        birthDate: DateTime.parse(json["birthDate"] ?? ""),
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
        updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
    
    );
  }

  Map<String, String> toJson() {
    Map<String, String> map = {
      'id': id ?? "",
      'name': name ?? "",
      'cpf': cpf ?? "",
      'email': email ?? "",
      'password': password ?? "",
      'gender': gender ?? "",
      'birthDate': birthDate?.toUtc().toString() ?? "",
      'createdAt': createdAt?.toUtc().toString() ?? "",
      'updatedAt': updatedAt?.toUtc().toString() ?? ""
    };

    return map;
  }
}
