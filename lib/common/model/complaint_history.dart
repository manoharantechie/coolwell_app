import 'dart:convert';

ComplaintHistoryModel complaintHistoryModelFromJson(String str) => ComplaintHistoryModel.fromJson(json.decode(str));

String complaintHistoryModelToJson(ComplaintHistoryModel data) => json.encode(data.toJson());

class ComplaintHistoryModel {
  bool? success;
  String? message;
  List<ComplaintHistoryResult>? result;

  ComplaintHistoryModel({
    this.success,
    this.message,
    this.result,
  });

  factory ComplaintHistoryModel.fromJson(Map<String, dynamic> json) => ComplaintHistoryModel(
    success: json["success"],
    message: json["message"],
    result: List<ComplaintHistoryResult>.from(json["result"].map((x) => ComplaintHistoryResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class ComplaintHistoryResult {
  dynamic serviceStatus;
  String? id;
  String? serviceId;
  DateTime? date;
  String? name;
  String? address;
  String? city;
  String? zip;
  String? latitude;
  String? longitude;
  dynamic amount;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ComplaintHistoryResult({
    this.serviceStatus,
    this.id,
    this.serviceId,
    this.date,
    this.name,
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

  factory ComplaintHistoryResult.fromJson(Map<String, dynamic> json) => ComplaintHistoryResult(
    serviceStatus: json["service_status"],
    id: json["_id"],
    serviceId: json["Service_id"],
    date: DateTime.parse(json["Date"]),
    name: json["Name"],
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
    "Date": date!.toIso8601String(),
    "Name": name,
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
