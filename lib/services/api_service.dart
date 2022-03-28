import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String baseUrl = "http://192.168.0.14:3333/api";
  static final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Uri getRequestUrl(String path) {
    return Uri.parse("$baseUrl/$path");
  }

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await http.post(
      getRequestUrl('login'),
      body: json.encode(loginRequestModel.toJson()),
      headers: requestHeaders
    );

    LoginResponseModel responseMaped = LoginResponseModel.fromJson(json.decode(response.body));

    if(response.statusCode == 201){
      return responseMaped;
    } 

    throw responseMaped;
  }

  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpRequestModel) async {
    final response = await http.post(
      getRequestUrl('users'),
      body: json.encode(signUpRequestModel.toJson()),
      headers: requestHeaders
    );

     SignUpResponseModel responseMaped = SignUpResponseModel.fromJson(json.decode(response.body));

    if(response.statusCode == 201){
      return responseMaped;
    } 

    throw responseMaped;
  }

  Future<void> validToken(String token) async {
    final response = await http.get(
      getRequestUrl('validToken'),
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    if(response.statusCode == 200){
      return;
    } 
 
    throw 'Invalid Token';
  }
}