// // To parse this JSON data, do
// //
// //     final searchedBooksModel = searchedBooksModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SearchedBooksModel searchedBooksModelFromJson(String str) => SearchedBooksModel.fromJson(json.decode(str));
//
// String searchedBooksModelToJson(SearchedBooksModel data) => json.encode(data.toJson());
//
// class SearchedBooksModel {
//   bool success;
//   String message;
//   Data data;
//
//   SearchedBooksModel({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   factory SearchedBooksModel.fromJson(Map<String, dynamic> json) => SearchedBooksModel(
//     success: json["success"],
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   List<SearchedItem> items;
//   int page;
//   int limit;
//   int total;
//   int totalPages;
//   Sort sort;
//   String query;
//
//   Data({
//     required this.items,
//     required this.page,
//     required this.limit,
//     required this.total,
//     required this.totalPages,
//     required this.sort,
//     required this.query,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     items: List<SearchedItem>.from(json["items"].map((x) => SearchedItem.fromJson(x))),
//     page: json["page"],
//     limit: json["limit"],
//     total: json["total"],
//     totalPages: json["totalPages"],
//     sort: Sort.fromJson(json["sort"]),
//     query: json["query"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "items": List<dynamic>.from(items.map((x) => x.toJson())),
//     "page": page,
//     "limit": limit,
//     "total": total,
//     "totalPages": totalPages,
//     "sort": sort.toJson(),
//     "query": query,
//   };
// }
//
// class SearchedItem {
//   String id;
//   String title;
//   String author;
//   String edition;
//   String courseCode;
//   String level;
//   int price;
//   int quantity;
//   int lowAlert;
//   int orderCount;
//   String imageUrl;
//   String imageFileId;
//   String status;
//   String universityId;
//   String adminId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   SearchedItem({
//     required this.id,
//     required this.title,
//     required this.author,
//     required this.edition,
//     required this.courseCode,
//     required this.level,
//     required this.price,
//     required this.quantity,
//     required this.lowAlert,
//     required this.orderCount,
//     required this.imageUrl,
//     required this.imageFileId,
//     required this.status,
//     required this.universityId,
//     required this.adminId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory SearchedItem.fromJson(Map<String, dynamic> json) => SearchedItem(
//     id: json["id"],
//     title: json["title"],
//     author: json["author"],
//     edition: json["edition"],
//     courseCode: json["courseCode"],
//     level: json["level"],
//     price: json["price"],
//     quantity: json["quantity"],
//     lowAlert: json["lowAlert"],
//     orderCount: json["orderCount"],
//     imageUrl: json["imageUrl"],
//     imageFileId: json["imageFileId"],
//     status: json["status"],
//     universityId: json["universityId"],
//     adminId: json["adminId"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "author": author,
//     "edition": edition,
//     "courseCode": courseCode,
//     "level": level,
//     "price": price,
//     "quantity": quantity,
//     "lowAlert": lowAlert,
//     "orderCount": orderCount,
//     "imageUrl": imageUrl,
//     "imageFileId": imageFileId,
//     "status": status,
//     "universityId": universityId,
//     "adminId": adminId,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//   };
// }
//
// class Sort {
//   String field;
//   String order;
//
//   Sort({
//     required this.field,
//     required this.order,
//   });
//
//   factory Sort.fromJson(Map<String, dynamic> json) => Sort(
//     field: json["field"],
//     order: json["order"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "field": field,
//     "order": order,
//   };
// }
