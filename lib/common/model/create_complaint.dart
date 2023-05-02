import 'dart:convert';

CreateComplaintDetails createComplaintDetailsFromJson(String str) => CreateComplaintDetails.fromJson(json.decode(str));

String createComplaintDetailsToJson(CreateComplaintDetails data) => json.encode(data.toJson());

class CreateComplaintDetails {
  bool? success;
  CreateComplaintResult? result;
  String? message;

  CreateComplaintDetails({
    this.success,
    this.result,
    this.message,
  });

  factory CreateComplaintDetails.fromJson(Map<String, dynamic> json) => CreateComplaintDetails(
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

  CreateComplaintResult({
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

  factory CreateComplaintResult.fromJson(Map<String, dynamic> json) => CreateComplaintResult(
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
