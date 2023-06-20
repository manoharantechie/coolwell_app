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
  dynamic serviceStatus;
  Technician? technician;

  UsersHistoryResult({
    this.id,
    this.service,
    this.serviceStatus,
    this.technician,
  });

  factory UsersHistoryResult.fromJson(Map<String, dynamic> json) => UsersHistoryResult(
    id: json["_id"],
    service: Service.fromJson(json["service"]),
    serviceStatus: json["service_status"],
    technician: Technician.fromJson(json["technician"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "service": service!.toJson(),
    "service_status": serviceStatus,
    "technician": technician!.toJson(),
  };
}

class Service {
  List<String>? checkList;
  List<String>? coverImage;
  String? serviceName;
  String? notes;
  dynamic rattings;

  Service({
    this.checkList,
    this.coverImage,
    this.serviceName,
    this.notes,
    this.rattings,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    checkList: List<String>.from(json["Check_List"].map((x) => x)),
    coverImage: List<String>.from(json["Cover_Image"].map((x) => x)),
    serviceName: json["Service_Name"],
    notes: json["Notes"],
    rattings: json["Rattings"],
  );

  Map<String, dynamic> toJson() => {
    "Check_List": List<dynamic>.from(checkList!.map((x) => x)),
    "Cover_Image": List<dynamic>.from(coverImage!.map((x) => x)),
    "Service_Name": serviceName,
    "Notes": notes,
    "Rattings": rattings,
  };
}

class Technician {
  String? id;
  dynamic startTime;
  dynamic endTime;
  TechnicianClass? technician;

  Technician({
    this.id,
    this.startTime,
    this.endTime,
    this.technician,
  });

  factory Technician.fromJson(Map<String, dynamic> json) => Technician(
    id: json["_id"],
    startTime: json["Start_Time"],
    endTime: json["End_Time"],
    technician: TechnicianClass.fromJson(json["Technician"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Start_Time": startTime,
    "End_Time": endTime,
    "Technician": technician!.toJson(),
  };
}

class TechnicianClass {
  String? id;
  String? phone;
  String? name;

  TechnicianClass({
    this.id,
    this.phone,
    this.name,
  });

  factory TechnicianClass.fromJson(Map<String, dynamic> json) => TechnicianClass(
    id: json["_id"],
    phone: json["phone"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "name": name,
  };
}
