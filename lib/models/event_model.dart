import 'package:brota_ai_app/models/sport_model.dart';

import 'base/request_model.dart';

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
  SportModel? sport;
  int? minAge;
  int? maxAge;
  Map<String, dynamic>? locale;
  String? description;
  String? gender;
  String? initialDateTime;

  EventRequestModel(
      {this.minAge,
      this.maxAge,
      this.locale,
      this.description,
      this.name,
      this.sport,
      this.gender,
      this.initialDateTime});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'sportId': sport!.id ?? "",
      'minAge': minAge,
      'maxAge': maxAge,
      'locale': locale,
      'description': description,
      'gender': gender,
      'initialDateTime': initialDateTime
    };

    return map;
  }

  @override
  String toString() {
    return "{" +
        name! +
        ", " +
        sport!.toString() +
        ", " +
        (maxAge.toString()) +
        ", " +
        locale!.toString() +
        ", " +
        description! +
        ", " +
        (gender ?? "") +
        ", " +
        initialDateTime! +
        "}";
  }
}
