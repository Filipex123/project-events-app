import 'dart:developer';
import 'package:brota_ai_app/models/event_card_model.dart';
import 'package:brota_ai_app/models/event_model.dart';
import 'package:brota_ai_app/models/login_model.dart';
import 'package:brota_ai_app/models/signup_model.dart';
import 'package:brota_ai_app/models/user_model.dart';
import 'package:brota_ai_app/services/token_storage_service.dart';
import 'package:brota_ai_app/utils/globals.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static const String baseUrl = "http://192.168.50.216:3333";
  static final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Uri getRequestUrl(String path) {
    return Uri.parse("$baseUrl/$path");
  }

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await http.post(getRequestUrl('login'),
        body: json.encode(loginRequestModel.toJson()), headers: requestHeaders);
    LoginResponseModel responseMaped =
        LoginResponseModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return responseMaped;
    }

    throw responseMaped;
  }

  Future<SignUpResponseModel> signUp(
      SignUpRequestModel signUpRequestModel) async {
    final response = await http.post(getRequestUrl('users'),
        body: json.encode(signUpRequestModel.toJson()),
        headers: requestHeaders);

    SignUpResponseModel responseMaped =
        SignUpResponseModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return responseMaped;
    }

    throw responseMaped;
  }

  Future<UsersModel> getLogged() async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response =
        await http.get(getRequestUrl('usersLogged'), headers: headerWithToken);

    UsersModel responseMaped = UsersModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      GetIt.I<UsersModel>().name = responseMaped.name;
      return responseMaped;
    }

    throw responseMaped;
  }

  Future<void> validToken(String token) async {
    final response = await http.get(getRequestUrl('validToken'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return;
    }

    throw 'Invalid Token';
  }

  Future<EventResponseModel> registerEvent(
      EventRequestModel eventRequestModel) async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response = await http.post(getRequestUrl('events'),
        body: json.encode(eventRequestModel.toJson()),
        headers: headerWithToken);

    EventResponseModel responseMaped =
        EventResponseModel.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return responseMaped;
    }

    throw responseMaped;
  }

  Future<bool> updateEvent(EventRequestCardModel eventRequestModel) async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    final eventId = eventRequestModel.id;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    var response = await http.put(getRequestUrl('events/$eventId'),
        body: json.encode(eventRequestModel.toJson()),
        headers: headerWithToken);

    if (response.statusCode != 201) {
      throw response;
    }
    return true;
  }

  Future<bool> joinEvent(String eventId) async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    var response = await http.post(getRequestUrl('events/join/$eventId'),
        headers: headerWithToken);

    if (response.statusCode != 201) {
      throw response;
    }
    return true;
  }

  Future<List<EventResponseCardModel>> getJoinedEvents() async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response =
        await http.get(getRequestUrl('events/join'), headers: headerWithToken);

    final List<dynamic> responseMaped = json.decode(response.body);

    final eventCardList = responseMaped
        .map((json) => EventResponseCardModel.fromJson(json["event"]))
        .toList();

    if (response.statusCode == 200) {
      return eventCardList;
    }

    throw responseMaped;
  }

  Future<List<UsersModel>> getJoinedUsers(String eventId) async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response = await http.get(
        getRequestUrl('events/$eventId/joinedUsers'),
        headers: headerWithToken);

    final List<dynamic> responseMaped = json.decode(response.body);

    final usersList =
        responseMaped.map((json) => UsersModel.fromJson(json["user"])).toList();

    if (response.statusCode == 200) {
      return usersList;
    }

    throw responseMaped;
  }

  void deleteEvent(String id) async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    await http.delete(getRequestUrl('events/$id'), headers: headerWithToken);
  }

  Future<List<EventResponseCardModel>> getAllEvents() async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response =
        await http.get(getRequestUrl('events'), headers: headerWithToken);

    final List<dynamic> responseMaped = json.decode(response.body);

    final eventCardList = responseMaped
        .map((json) => EventResponseCardModel.fromJson(json))
        .toList();

    if (response.statusCode == 200) {
      return eventCardList;
    }

    throw responseMaped;
  }

  Future<List<EventResponseCardModel>> getAllEventsByOwner() async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response = await http.get(getRequestUrl('events/owner/'),
        headers: headerWithToken);

    final List<dynamic> responseMaped = json.decode(response.body);

    final eventCardList = responseMaped
        .map((json) => EventResponseCardModel.fromJson(json))
        .toList();

    if (response.statusCode == 200) {
      return eventCardList;
    }

    throw responseMaped;
  }

  Future<List<dynamic>> getAllSports() async {
    final tokenString = await TokenStorageService.read();
    final headerWithToken = requestHeaders;
    headerWithToken['Authorization'] = 'Bearer $tokenString';

    final response =
        await http.get(getRequestUrl('sports'), headers: headerWithToken);

    final List<dynamic> responseMaped = json.decode(response.body);

    log(response.body.toString());

    if (response.statusCode == 200) {
      sportList = responseMaped;
      return responseMaped;
    }

    throw responseMaped;
  }
}
