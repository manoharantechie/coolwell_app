import 'dart:convert';

GetServiceTimeModel getServiceTimeModelFromJson(String str) => GetServiceTimeModel.fromJson(json.decode(str));

String getServiceTimeModelToJson(GetServiceTimeModel data) => json.encode(data.toJson());

class GetServiceTimeModel {
  bool? success;
  GetServiceTimeResult? result;
  String? message;

  GetServiceTimeModel({
    this.success,
    this.result,
    this.message,
  });

  factory GetServiceTimeModel.fromJson(Map<String, dynamic> json) => GetServiceTimeModel(
    success: json["success"],
    result: GetServiceTimeResult.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class GetServiceTimeResult {
  String? id;
  String? startTime;
  String? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetServiceTimeResult({
    this.id,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  factory GetServiceTimeResult.fromJson(Map<String, dynamic> json) => GetServiceTimeResult(
    id: json["_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "start_time": startTime,
    "end_time": endTime,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
