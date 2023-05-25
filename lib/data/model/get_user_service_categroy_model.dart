import 'dart:convert';

GetUserServiceCategoryModel getUserServiceCategoryModelFromJson(String str) => GetUserServiceCategoryModel.fromJson(json.decode(str));

String getUserServiceCategoryModelToJson(GetUserServiceCategoryModel data) => json.encode(data.toJson());

class GetUserServiceCategoryModel {
  bool? success;
  List<GetUserServiceResult>? result;
  String? message;

  GetUserServiceCategoryModel({
    this.success,
    this.result,
    this.message,
  });

  factory GetUserServiceCategoryModel.fromJson(Map<String, dynamic> json) => GetUserServiceCategoryModel(
    success: json["success"],
    result: List<GetUserServiceResult>.from(json["result"].map((x) => GetUserServiceResult.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class GetUserServiceResult {
  String? offer;
  bool? status;
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetUserServiceResult({
    this.offer,
    this.status,
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory GetUserServiceResult.fromJson(Map<String, dynamic> json) => GetUserServiceResult(
    offer: json["offer"],
    status: json["status"],
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "offer": offer,
    "status": status,
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
