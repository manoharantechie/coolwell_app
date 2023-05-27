import 'dart:convert';

CreateComplaintDetailsModel createComplaintDetailsModelFromJson(String str) => CreateComplaintDetailsModel.fromJson(json.decode(str));

String createComplaintDetailsModelToJson(CreateComplaintDetailsModel data) => json.encode(data.toJson());

class CreateComplaintDetailsModel {
  bool? success;
  CreateComplaintResult? result;
  String? message;

  CreateComplaintDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  factory CreateComplaintDetailsModel.fromJson(Map<String, dynamic> json) => CreateComplaintDetailsModel(
    success: json["success"],
    result: CreateComplaintResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class CreateComplaintResult {
  dynamic serviceStatus;
  String? id;
  String? serviceId;
  dynamic date;
  String? address;
  String? city;
  String? zip;
  String? latitude;
  String? longitude;
  dynamic amount;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  CreateComplaintResult({
    this.serviceStatus,
    this.id,
    this.serviceId,
    this.date,
    this.address,
    this.city,
    this.zip,
    this.latitude,
    this.longitude,
    this.amount,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory CreateComplaintResult.fromJson(Map<String, dynamic> json) => CreateComplaintResult(
    serviceStatus: json["service_status"],
    id: json["_id"],
    serviceId: json["Service_id"],
    date: json["Date"],
    address: json["Address"],
    city: json["city"],
    zip: json["zip"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    amount: json["Amount"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "service_status": serviceStatus,
    "_id": id,
    "Service_id": serviceId,
    "Date": date,
    "Address": address,
    "city": city,
    "zip": zip,
    "latitude": latitude,
    "longitude": longitude,
    "Amount": amount,
    "user_id": userId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
