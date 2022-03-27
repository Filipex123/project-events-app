class SignUpResponseModel {
  final String token;
  final String error;

  SignUpResponseModel({required this.token, required this.error});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(token: json["token"] ?? "", error: json["message"] ?? "");
  }
}

class SignUpRequestModel {
  String name;
  String cpf;
  String email;
  String password;
  String confirmPassword;
  int age;

  SignUpRequestModel({required this.email, required this.password, required this.confirmPassword, required this.name, required this.cpf, required this.age});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'name': name, 'cpf': cpf,'email': email, 'password': password, 'age': age};
    return map;
  }
}