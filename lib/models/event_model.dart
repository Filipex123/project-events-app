import 'package:brota_ai_app/models/request_model.dart';

class EventResponseModel {
  final String token;
  final String error;

  EventResponseModel({required this.token, required this.error});

  factory EventResponseModel.fromJson(Map<String, dynamic> json) {
    return EventResponseModel(
        token: json["token"] ?? "", error: json["message"] ?? "");
  }
}

class EventRequestModel implements RequestModel {
  String? name;
  String? sport;
  String? minAge;
  String? maxAge;
  String? locale;
  String? describe;
  String? sex;
  DateTime? initialDateTime;

  EventRequestModel(
      {this.minAge,
      this.maxAge,
      this.locale,
      this.describe,
      this.name,
      this.sport,
      this.sex,
      this.initialDateTime});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'sport': sport,
      'minAge': minAge,
      'maxAge': maxAge,
      'locale': locale,
      'describe': describe,
      'sex': sex,
      'initialDateTime': initialDateTime?.toUtc().toString()
    };

    return map;
  }
}
