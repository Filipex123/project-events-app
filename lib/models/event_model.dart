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
  String? eventOwner;
  String? name;
  String? sport;
  String? minAge;
  String? maxAge;
  String? locale;
  String? description;
  String? sex;
  DateTime? initialDateTime;

  EventRequestModel(
      {this.eventOwner,
      this.minAge,
      this.maxAge,
      this.locale,
      this.description,
      this.name,
      this.sport,
      this.sex,
      this.initialDateTime});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'eventOwner': eventOwner,
      'name': name,
      'sport': sport,
      'minAge': minAge,
      'maxAge': maxAge,
      'locale': locale,
      'description': description,
      'sex': sex,
      'initialDateTime': initialDateTime?.toUtc().toString()
    };

    return map;
  }

  @override
  String toString() {
    return "{" +
        eventOwner! +
        ", " +
        name! +
        ", " +
        sport! +
        ", " +
        (minAge ?? "") +
        ", " +
        (maxAge ?? "") +
        ", " +
        locale! +
        ", " +
        description! +
        ", " +
        (sex ?? "") +
        ", " +
        initialDateTime!.toUtc().toString() +
        "}";
  }
}
