// To parse this JSON data, do
//
//     final allBooksModel = allBooksModelFromJson(jsonString);

import 'dart:convert';

AllBooksModel allBooksModelFromJson(String str) => AllBooksModel.fromJson(json.decode(str));

String allBooksModelToJson(AllBooksModel data) => json.encode(data.toJson());

class AllBooksModel {
  bool success;
  String message;
  Data data;

  AllBooksModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AllBooksModel.fromJson(Map<String, dynamic> json) => AllBooksModel(
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
  List<Item> items;
  int page;
  int limit;
  int total;
  int totalPages;
  Sort sort;
  String query;

  Data({
    required this.items,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.sort,
    required this.query,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPages: json["totalPages"],
    sort: Sort.fromJson(json["sort"]),
    query: json["query"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "total": total,
    "totalPages": totalPages,
    "sort": sort.toJson(),
    "query": query,
  };
}

class Item {
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

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"]??"",
    title: json["title"]??"",
    author: json["author"]??"",
    edition: json["edition"]??"",
    courseCode: json["courseCode"]??"",
    level: json["level"]??"",
    price: json["price"]??0,
    quantity: json["quantity"]??0,
    lowAlert: json["lowAlert"]??0,
    orderCount: json["orderCount"],
    imageUrl: json["imageUrl"]??"",
    imageFileId: json["imageFileId"]??"",
    status: json["status"]??"",
    universityId: json["universityId"]??"",
    adminId: json["adminId"]??"",
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

class Sort {
  String field;
  String order;

  Sort({
    required this.field,
    required this.order,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    field: json["field"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "order": order,
  };
}
