// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) => DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  bool success;
  String message;
  Data data;

  DepartmentModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
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
  List<Department> departments;

  Data({
    required this.departments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
  };
}

class Department {
  String id;
  String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
