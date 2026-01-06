// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

UniversityModel universityModelFromJson(String str) => UniversityModel.fromJson(json.decode(str));

String universityModelToJson(UniversityModel data) => json.encode(data.toJson());

class UniversityModel {
  bool success;
  String message;
  Data data;

  UniversityModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) => UniversityModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<University> universities;

  Data({
    required this.universities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    universities: List<University>.from(json["universities"].map((x) => University.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "universities": List<dynamic>.from(universities.map((x) => x.toJson())),
  };
}

class University {
  String id;
  String name;
  String slug;
  String state;
  String city;
  String logoUrl;
  String logoFileId;
  List<dynamic> pickupLocations;
  DateTime createdAt;
  DateTime updatedAt;

  University({
    required this.id,
    required this.name,
    required this.slug,
    required this.state,
    required this.city,
    required this.logoUrl,
    required this.logoFileId,
    required this.pickupLocations,
    required this.createdAt,
    required this.updatedAt,
  });

  factory University.fromJson(Map<String, dynamic> json) => University(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    state: json["state"],
    city: json["city"],
    logoUrl: json["logoUrl"],
    logoFileId: json["logoFileId"],
    pickupLocations: List<dynamic>.from(json["pickupLocations"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "state": state,
    "city": city,
    "logoUrl": logoUrl,
    "logoFileId": logoFileId,
    "pickupLocations": List<dynamic>.from(pickupLocations.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
