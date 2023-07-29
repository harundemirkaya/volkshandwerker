// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  int id;
  String name;
  dynamic description;
  DateTime createdAt;
  DateTime updatedAt;
  List<Company> companies;

  Categories({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.companies,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Company {
  int id;
  String name;
  String description;
  String phone;
  String email;
  String mobileNumber;
  String whatsappNumber;
  String website;
  String instagram;
  String facebook;
  String twitter;
  String linkedIn;
  String verificationStatus;
  String subscriptionStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic youtube;
  dynamic xing;

  Company({
    required this.id,
    required this.name,
    required this.description,
    required this.phone,
    required this.email,
    required this.mobileNumber,
    required this.whatsappNumber,
    required this.website,
    required this.instagram,
    required this.facebook,
    required this.twitter,
    required this.linkedIn,
    required this.verificationStatus,
    required this.subscriptionStatus,
    required this.createdAt,
    required this.updatedAt,
    this.youtube,
    this.xing,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        phone: json["phone"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        whatsappNumber: json["whatsappNumber"],
        website: json["website"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedIn: json["linkedIn"],
        verificationStatus: json["verificationStatus"],
        subscriptionStatus: json["subscriptionStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        youtube: json["youtube"],
        xing: json["xing"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "phone": phone,
        "email": email,
        "mobileNumber": mobileNumber,
        "whatsappNumber": whatsappNumber,
        "website": website,
        "instagram": instagram,
        "facebook": facebook,
        "twitter": twitter,
        "linkedIn": linkedIn,
        "verificationStatus": verificationStatus,
        "subscriptionStatus": subscriptionStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "youtube": youtube,
        "xing": xing,
      };
}
