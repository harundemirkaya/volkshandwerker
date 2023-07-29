// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String jwt;
  User user;

  LoginResponse({
    required this.jwt,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        jwt: json["jwt"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  DateTime createdAt;
  DateTime updatedAt;
  bool newsletter;
  dynamic subscriber;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.newsletter,
    this.subscriber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        newsletter: json["newsletter"],
        subscriber: json["subscriber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "newsletter": newsletter,
        "subscriber": subscriber,
      };
}
