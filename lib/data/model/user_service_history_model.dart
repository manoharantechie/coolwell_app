import 'dart:convert';

UsersHistoryModel usersHistoryModelFromJson(String str) => UsersHistoryModel.fromJson(json.decode(str));

String usersHistoryModelToJson(UsersHistoryModel data) => json.encode(data.toJson());

class UsersHistoryModel {
  bool? success;
  String? message;
  List<Result>? result;

  UsersHistoryModel({
    this.success,
    this.message,
    this.result,
  });

  factory UsersHistoryModel.fromJson(Map<String, dynamic> json) => UsersHistoryModel(
    success: json["success"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  String? id;
  ServiceId? serviceId;

  Result({
    this.id,
    this.serviceId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    serviceId: ServiceId.fromJson(json["Service_id"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Service_id": serviceId!.toJson(),
  };
}

class ServiceId {
  List<String>? checkList;
  List<String>? coverImage;
  String? id;
  String? serviceName;
  String? category;
  String? amount;
  String? time;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  ServiceId({
    this.checkList,
    this.coverImage,
    this.id,
    this.serviceName,
    this.category,
    this.amount,
    this.time,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    checkList: List<String>.from(json["Check_List"].map((x) => x)),
    coverImage: List<String>.from(json["Cover_Image"].map((x) => x)),
    id: json["_id"],
    serviceName: json["Service_Name"],
    category: json["Category"],
    amount: json["Amount"],
    time: json["Time"],
    notes: json["Notes"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Check_List": List<dynamic>.from(checkList!.map((x) => x)),
    "Cover_Image": List<dynamic>.from(coverImage!.map((x) => x)),
    "_id": id,
    "Service_Name": serviceName,
    "Category": category,
    "Amount": amount,
    "Time": time,
    "Notes": notes,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
