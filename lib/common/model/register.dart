// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}

class Result {
  Result({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.verification,
  });

  String? id;
  String? name;
  String? email;
  String? role;
  String? verification;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    verification: json["verification"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
    "verification": verification,
  };
}
