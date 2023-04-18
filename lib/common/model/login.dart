import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.success,
    this.result,
    this.message,
  });

  bool? success;
  Result? result;
  String? message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    success: json["success"],
    result: json["result"] == null || json["result"] == "null" ? Result():Result.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
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
  });

  String? id;
  String? name;
  String? email;
  String? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
  };
}
