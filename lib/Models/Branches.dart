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
  String? country;
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
        workingTimes!.add(WorkingTimes.fromJson(v));
      });
    }
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['openingHours'] = openingHours;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['street'] = street;
    data['houseNumber'] = houseNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['country'] = country;
    data['whatsappNumber'] = whatsappNumber;
    data['telegramUser'] = telegramUser;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (workingTimes != null) {
      data['WorkingTimes'] = workingTimes!.map((v) => v.toJson()).toList();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['end'] = end;
    data['start'] = start;
    data['active'] = active;
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
  String? youtube;
  String? xing;
  String? mainBranch;
  List<Branches>? branches;
  List<Categories>? categories;
  Logo? logo;
  String? verificationDocuments;
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
        branches!.add(Branches.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      /* categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      }); */
    }
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    //verificationDocuments = json['verificationDocuments'];
    subscriber = json['subscriber'] != null
        ? Subscriber.fromJson(json['subscriber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['phone'] = phone;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['whatsappNumber'] = whatsappNumber;
    data['website'] = website;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['linkedIn'] = linkedIn;
    data['verificationStatus'] = verificationStatus;
    data['subscriptionStatus'] = subscriptionStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['youtube'] = youtube;
    data['xing'] = xing;
    data['mainBranch'] = mainBranch;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    data['verificationDocuments'] = verificationDocuments;
    if (subscriber != null) {
      data['subscriber'] = subscriber!.toJson();
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
  String? country;
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
        workingTimes!.add(WorkingTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['openingHours'] = openingHours;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['street'] = street;
    data['houseNumber'] = houseNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['country'] = country;
    data['whatsappNumber'] = whatsappNumber;
    data['telegramUser'] = telegramUser;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (workingTimes != null) {
      data['WorkingTimes'] = workingTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
