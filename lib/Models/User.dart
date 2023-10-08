// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String username;
  String email;
  bool confirmed;
  bool blocked;
  DateTime createdAt;
  DateTime updatedAt;
  bool newsletter;
  Subscriber subscriber;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.newsletter,
    required this.subscriber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        newsletter: json["newsletter"],
        subscriber: Subscriber.fromJson(json["subscriber"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "newsletter": newsletter,
        "subscriber": subscriber.toJson(),
      };
}

class Subscriber {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String postalCode;
  String houseNumber;
  String houseNumberAdd;
  String street;
  String city;
  String countryIso2;
  String language;
  String telephone;
  String vatNumber;
  dynamic iban;
  dynamic bic;
  String nameZahlungsempfaenger;
  DateTime createdAt;
  DateTime updatedAt;
  String gender;
  Company company;
  Pack pack;

  Subscriber({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.postalCode,
    required this.houseNumber,
    required this.houseNumberAdd,
    required this.street,
    required this.city,
    required this.countryIso2,
    required this.language,
    required this.telephone,
    required this.vatNumber,
    required this.iban,
    required this.bic,
    required this.nameZahlungsempfaenger,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.company,
    required this.pack,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) => Subscriber(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        postalCode: json["postalCode"],
        houseNumber: json["houseNumber"],
        houseNumberAdd: json["houseNumberAdd"],
        street: json["street"],
        city: json["city"],
        countryIso2: json["countryIso2"],
        language: json["language"],
        telephone: json["telephone"],
        vatNumber: json["vatNumber"],
        iban: json["IBAN"],
        bic: json["BIC"],
        nameZahlungsempfaenger: json["nameZahlungsempfaenger"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        gender: json["gender"],
        company: Company.fromJson(json["company"]),
        pack: Pack.fromJson(json["pack"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "postalCode": postalCode,
        "houseNumber": houseNumber,
        "houseNumberAdd": houseNumberAdd,
        "street": street,
        "city": city,
        "countryIso2": countryIso2,
        "language": language,
        "telephone": telephone,
        "vatNumber": vatNumber,
        "IBAN": iban,
        "BIC": bic,
        "nameZahlungsempfaenger": nameZahlungsempfaenger,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "gender": gender,
        "company": company.toJson(),
        "pack": pack.toJson(),
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
  List<dynamic> branches;

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
    required this.youtube,
    required this.xing,
    required this.branches,
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
        branches: List<dynamic>.from(json["branches"].map((x) => x)),
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
        "branches": List<dynamic>.from(branches.map((x) => x)),
      };
}

class Pack {
  int id;
  String name;
  int pictures;
  int sections;
  int branches;
  String description;
  double price;
  String color;
  String ecurringProductId;
  bool allowSocialmedia;
  DateTime createdAt;
  DateTime updatedAt;

  Pack({
    required this.id,
    required this.name,
    required this.pictures,
    required this.sections,
    required this.branches,
    required this.description,
    required this.price,
    required this.color,
    required this.ecurringProductId,
    required this.allowSocialmedia,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pack.fromJson(Map<String, dynamic> json) => Pack(
        id: json["id"],
        name: json["name"],
        pictures: json["pictures"],
        sections: json["sections"],
        branches: json["branches"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        color: json["color"],
        ecurringProductId: json["ecurringProductId"],
        allowSocialmedia: json["allowSocialmedia"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pictures": pictures,
        "sections": sections,
        "branches": branches,
        "description": description,
        "price": price,
        "color": color,
        "ecurringProductId": ecurringProductId,
        "allowSocialmedia": allowSocialmedia,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
