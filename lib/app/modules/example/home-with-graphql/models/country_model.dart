class CountryModel {
  CountryModel({
    required this.data,
  });

  final Data? data;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return "$data, ";
  }
}

class Data {
  Data({
    required this.countries,
  });

  final List<Country> countries;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      countries: json["countries"] == null
          ? []
          : List<Country>.from(
              json["countries"]!.map((x) => Country.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "countries": countries.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$countries, ";
  }
}

class Country {
  Country({
    required this.code,
    required this.name,
    required this.emoji,
  });

  final String? code;
  final String? name;
  final String? emoji;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json["code"],
      name: json["name"],
      emoji: json["emoji"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "emoji": emoji,
      };

  @override
  String toString() {
    return "$code, $name, $emoji, ";
  }
}


