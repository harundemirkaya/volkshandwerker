import 'Categories.dart';
import 'Images.dart';
import 'Logo.dart';
import 'Subscriber.dart';

class BranchModel {
  int? id;
  String? name;
  String? openingHours;
  String? postalCode;
  String? city;
  String? street;
  String? houseNumber;
  double? latitude;
  double? longitude;
  Null? country;
  String? whatsappNumber;
  String? telegramUser;
  String? createdAt;
  String? updatedAt;
  List<WorkingTimes>? workingTimes;
  Company? company;
  List<Images>? images;

  BranchModel(
      {this.id,
      this.name,
      this.openingHours,
      this.postalCode,
      this.city,
      this.street,
      this.houseNumber,
      this.latitude,
      this.longitude,
      this.country,
      this.whatsappNumber,
      this.telegramUser,
      this.createdAt,
      this.updatedAt,
      this.workingTimes,
      this.company,
      this.images});

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    openingHours = json['openingHours'];
    postalCode = json['postalCode'];
    city = json['city'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    whatsappNumber = json['whatsappNumber'];
    telegramUser = json['telegramUser'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['WorkingTimes'] != null) {
      workingTimes = <WorkingTimes>[];
      json['WorkingTimes'].forEach((v) {
        workingTimes!.add(new WorkingTimes.fromJson(v));
      });
    }
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['openingHours'] = this.openingHours;
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['street'] = this.street;
    data['houseNumber'] = this.houseNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country'] = this.country;
    data['whatsappNumber'] = this.whatsappNumber;
    data['telegramUser'] = this.telegramUser;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.workingTimes != null) {
      data['WorkingTimes'] = this.workingTimes!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkingTimes {
  String? day;
  String? end;
  String? start;
  bool? active;

  WorkingTimes({this.day, this.end, this.start, this.active});

  WorkingTimes.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    end = json['end'];
    start = json['start'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['end'] = this.end;
    data['start'] = this.start;
    data['active'] = this.active;
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? description;
  String? phone;
  String? email;
  String? mobileNumber;
  String? whatsappNumber;
  String? website;
  String? instagram;
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? verificationStatus;
  String? subscriptionStatus;
  String? createdAt;
  String? updatedAt;
  Null? youtube;
  Null? xing;
  Null? mainBranch;
  List<Branches>? branches;
  List<Categories>? categories;
  Logo? logo;
  Null? verificationDocuments;
  Subscriber? subscriber;

  Company(
      {this.id,
      this.name,
      this.description,
      this.phone,
      this.email,
      this.mobileNumber,
      this.whatsappNumber,
      this.website,
      this.instagram,
      this.facebook,
      this.twitter,
      this.linkedIn,
      this.verificationStatus,
      this.subscriptionStatus,
      this.createdAt,
      this.updatedAt,
      this.youtube,
      this.xing,
      this.mainBranch,
      this.branches,
      this.categories,
      this.logo,
      this.verificationDocuments,
      this.subscriber});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    whatsappNumber = json['whatsappNumber'];
    website = json['website'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedIn = json['linkedIn'];
    verificationStatus = json['verificationStatus'];
    subscriptionStatus = json['subscriptionStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    youtube = json['youtube'];
    xing = json['xing'];
    mainBranch = json['mainBranch'];
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(new Branches.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      /* categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      }); */
    }
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    //verificationDocuments = json['verificationDocuments'];
    subscriber = json['subscriber'] != null
        ? new Subscriber.fromJson(json['subscriber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['whatsappNumber'] = this.whatsappNumber;
    data['website'] = this.website;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedIn'] = this.linkedIn;
    data['verificationStatus'] = this.verificationStatus;
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['youtube'] = this.youtube;
    data['xing'] = this.xing;
    data['mainBranch'] = this.mainBranch;
    if (this.branches != null) {
      data['branches'] = this.branches!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    data['verificationDocuments'] = this.verificationDocuments;
    if (this.subscriber != null) {
      data['subscriber'] = this.subscriber!.toJson();
    }
    return data;
  }
}

class Branches {
  int? id;
  String? name;
  String? openingHours;
  String? postalCode;
  String? city;
  String? street;
  String? houseNumber;
  double? latitude;
  double? longitude;
  Null? country;
  String? whatsappNumber;
  String? telegramUser;
  String? createdAt;
  String? updatedAt;
  List<WorkingTimes>? workingTimes;

  Branches(
      {this.id,
      this.name,
      this.openingHours,
      this.postalCode,
      this.city,
      this.street,
      this.houseNumber,
      this.latitude,
      this.longitude,
      this.country,
      this.whatsappNumber,
      this.telegramUser,
      this.createdAt,
      this.updatedAt,
      this.workingTimes});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    openingHours = json['openingHours'];
    postalCode = json['postalCode'];
    city = json['city'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    whatsappNumber = json['whatsappNumber'];
    telegramUser = json['telegramUser'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['WorkingTimes'] != null) {
      workingTimes = <WorkingTimes>[];
      json['WorkingTimes'].forEach((v) {
        workingTimes!.add(new WorkingTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['openingHours'] = this.openingHours;
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['street'] = this.street;
    data['houseNumber'] = this.houseNumber;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country'] = this.country;
    data['whatsappNumber'] = this.whatsappNumber;
    data['telegramUser'] = this.telegramUser;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.workingTimes != null) {
      data['WorkingTimes'] = this.workingTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
