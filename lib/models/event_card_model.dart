class EventResponseCardModel {
  String? id;
  String? name;
  String? sport;
  int? minAge;
  int? maxAge;
  String? locale;
  String? description;
  String? gender;
  DateTime? initialDateTime;

  EventResponseCardModel(
      {this.id,
      this.minAge,
      this.maxAge,
      this.locale,
      this.description,
      this.name,
      this.sport,
      this.gender,
      this.initialDateTime});

  factory EventResponseCardModel.fromJson(dynamic json) {
    return EventResponseCardModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        sport: json["sport"] ?? "",
        minAge: json["minAge"],
        maxAge: json["maxAge"],
        locale: json["locale"] ?? "",
        description: json["description"] ?? "",
        gender: json["gender"] ?? "",
        initialDateTime: DateTime.parse(json["initialDateTime"]));
  }
}

class EventRequestCardModel {
  String? id;
  String? name;
  String? sport;
  String? minAge;
  String? maxAge;
  String? locale;
  String? description;
  String? gender;
  String? initialDateTime;

  EventRequestCardModel(
      {this.id,
      this.minAge,
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
      'id': id,
      'name': name,
      'sport': sport,
      'minAge': minAge,
      'maxAge': maxAge,
      'locale': locale,
      'description': description,
      'gender': gender,
      'initialDateTime': initialDateTime
    };

    return map;
  }
}
