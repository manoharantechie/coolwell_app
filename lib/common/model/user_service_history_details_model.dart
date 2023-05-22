import 'dart:convert';

UsersHistoryDetailsModel usersHistoryDetailsModelFromJson(String str) => UsersHistoryDetailsModel.fromJson(json.decode(str));

String usersHistoryDetailsModelToJson(UsersHistoryDetailsModel data) => json.encode(data.toJson());

class UsersHistoryDetailsModel {
  bool? success;
  String? message;
  UsersHistoryResult? result;

  UsersHistoryDetailsModel({
    this.success,
    this.message,
    this.result,
  });

  factory UsersHistoryDetailsModel.fromJson(Map<String, dynamic> json) => UsersHistoryDetailsModel(
    success: json["success"],
    message: json["message"],
    result: UsersHistoryResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}

class UsersHistoryResult {
  String? id;
  Service? service;
  Technician? technician;

  UsersHistoryResult({
    this.id,
    this.service,
    this.technician,
  });

  factory UsersHistoryResult.fromJson(Map<String, dynamic> json) => UsersHistoryResult(
    id: json["_id"],
    service: Service.fromJson(json["service"]),
    technician: Technician.fromJson(json["technician"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "service": service!.toJson(),
    "technician": technician!.toJson(),
  };
}

class Service {
  List<String>? coverImage;
  String? serviceName;
  String? notes;
  List<String>? checkList;

  Service({
    this.coverImage,
    this.serviceName,
    this.notes,
    this.checkList,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    coverImage: List<String>.from(json["Cover_Image"].map((x) => x)),
    serviceName: json["Service_Name"],
    notes: json["Notes"],
    checkList: List<String>.from(json["Check_List"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Cover_Image": List<dynamic>.from(coverImage!.map((x) => x)),
    "Service_Name": serviceName,
    "Notes": notes,
    "Check_List": List<dynamic>.from(checkList!.map((x) => x)),
  };
}

class Technician {
  String? id;
  String? name;
  String? phone;

  Technician({
    this.id,
    this.name,
    this.phone,
  });

  factory Technician.fromJson(Map<String, dynamic> json) => Technician(
    id: json["_id"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "phone": phone,
  };
}
