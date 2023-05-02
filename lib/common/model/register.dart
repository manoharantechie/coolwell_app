// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

CommonModel registerFromJson(String str) => CommonModel.fromJson(json.decode(str));

String registerToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel {
  CommonModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}

