class CountryoNeModel {
  CountryoNeModel({
    required this.data,
  });

  final Data? data;

  factory CountryoNeModel.fromJson(Map<String, dynamic> json) {
    return CountryoNeModel(
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
    required this.country,
  });

  final CountryData? country;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      country: json["country"] == null
          ? null
          : CountryData.fromJson(json["country"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
      };

  @override
  String toString() {
    return "$country, ";
  }
}

class CountryData {
  CountryData({
    required this.name,
    required this.native,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.languages,
    required this.emoji,
  });

  final String? name;
  final String? native;
  final String? phone;
  final Continent? continent;
  final String? capital;
  final String? currency;
  final List<Language> languages;
  final String? emoji;

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      name: json["name"],
      native: json["native"],
      phone: json["phone"],
      continent: json["continent"] == null
          ? null
          : Continent.fromJson(json["continent"]),
      capital: json["capital"],
      currency: json["currency"],
      languages: json["languages"] == null
          ? []
          : List<Language>.from(
              json["languages"]!.map((x) => Language.fromJson(x))),
      emoji: json["emoji"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "native": native,
        "phone": phone,
        "continent": continent?.toJson(),
        "capital": capital,
        "currency": currency,
        "languages": languages.map((x) => x.toJson()).toList(),
        "emoji": emoji,
      };

  @override
  String toString() {
    return "$name, $native, $phone, $continent, $capital, $currency, $languages, $emoji, ";
  }
}

class Continent {
  Continent({
    required this.name,
  });

  final String? name;

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  @override
  String toString() {
    return "$name, ";
  }
}

class Language {
  Language({
    required this.code,
    required this.name,
  });

  final String? code;
  final String? name;

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json["code"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };

  @override
  String toString() {
    return "$code, $name, ";
  }
}
