// To parse this JSON data, do
//
//     final recommendedBooksModel = recommendedBooksModelFromJson(jsonString);

import 'dart:convert';

RecommendedBooksModel recommendedBooksModelFromJson(String str) => RecommendedBooksModel.fromJson(json.decode(str));

String recommendedBooksModelToJson(RecommendedBooksModel data) => json.encode(data.toJson());

class RecommendedBooksModel {
  bool success;
  String message;
  Data data;

  RecommendedBooksModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RecommendedBooksModel.fromJson(Map<String, dynamic> json) => RecommendedBooksModel(
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
  List<Book> books;

  Data({
    required this.books,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}

class Book {
  String id;
  String title;
  String author;
  String edition;
  String courseCode;
  String level;
  int price;
  int quantity;
  int lowAlert;
  int orderCount;
  String imageUrl;
  String imageFileId;
  String status;
  String universityId;
  String adminId;
  DateTime createdAt;
  DateTime updatedAt;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.edition,
    required this.courseCode,
    required this.level,
    required this.price,
    required this.quantity,
    required this.lowAlert,
    required this.orderCount,
    required this.imageUrl,
    required this.imageFileId,
    required this.status,
    required this.universityId,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["id"],
    title: json["title"],
    author: json["author"],
    edition: json["edition"],
    courseCode: json["courseCode"],
    level: json["level"],
    price: json["price"],
    quantity: json["quantity"],
    lowAlert: json["lowAlert"],
    orderCount: json["orderCount"],
    imageUrl: json["imageUrl"],
    imageFileId: json["imageFileId"],
    status: json["status"],
    universityId: json["universityId"],
    adminId: json["adminId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "edition": edition,
    "courseCode": courseCode,
    "level": level,
    "price": price,
    "quantity": quantity,
    "lowAlert": lowAlert,
    "orderCount": orderCount,
    "imageUrl": imageUrl,
    "imageFileId": imageFileId,
    "status": status,
    "universityId": universityId,
    "adminId": adminId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
