import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final String baseUrl = "http://192.168.0.14:3333/api";

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    Uri requestUrl = Uri.parse("$baseUrl/login");

    final response = await http.post(requestUrl, body: loginRequestModel.toJson());

    LoginResponseModel responseMaped = LoginResponseModel.fromJson(json.decode(response.body));

    if(response.statusCode == 201){
      return responseMaped;
    } 

    throw responseMaped;
  }

  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpRequestModel) async {
    Uri requestUrl = Uri.parse("$baseUrl/users");

    final response = await http.post(requestUrl, body: signUpRequestModel.toJson());

     SignUpResponseModel responseMaped = SignUpResponseModel.fromJson(json.decode(response.body));

    if(response.statusCode == 201){
      return responseMaped;
    } 

    throw responseMaped;
  }

  Future<void> validToken(String token) async {
    Uri requestUrl = Uri.parse("$baseUrl/validToken");

    Map<String, dynamic> requestBody = {'token': token};

    final response = await http.get(requestUrl, headers: {
      'Authorization': 'Bearer $token',
    });

    if(response.statusCode == 200){
      return;
    } 
 
    throw 'Invalid Token';
  }
}