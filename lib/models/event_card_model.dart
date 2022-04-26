class EventCardResponseModel {
  String id;
  String? name;
  String? sport;
  int? minAge;
  int? maxAge;
  String? locale;
  String? description;
  String? gender;
  DateTime? initialDateTime;

  EventCardResponseModel(
      {required this.id,
      this.minAge,
      this.maxAge,
      this.locale,
      this.description,
      this.name,
      this.sport,
      this.gender,
      this.initialDateTime});

  factory EventCardResponseModel.fromJson(dynamic json) {
    return EventCardResponseModel(
        id: json["id"],
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
