class SportModel {
  String? id;
  String? name;
}

class SportModelR {
  String? id;
  String? name;
  
  SportModelR({this.id, this.name});

  // static SportModelR fromLoginRequestModel(unknow model) {
  //   return SportModelR(email: model.email, password: model.password);
  // }

  factory SportModelR.fromJson(dynamic json) {
    return SportModelR(
        name: json["name"] ?? "",
        id: json["id"] ?? "",
    );
  }

  Map<String, String> toJson() {
    Map<String, String> map = {
      'id': id ?? "",
      'name': name ?? ""
    };

    return map;
  }
}
