class SubscriberUpdate {
  String? companyName;
  String? firstName;
  String? lastName;
  String? street;
  String? houseNumber;
  String? postalCode;
  String? city;
  String? countryIso2;
  String? gender;
  String? genderText;
  String? country;
  String? language;
  String? packId;
  String? telephone;
  String? vatNumber;
  String? nameZahlungsempfaenger;

  SubscriberUpdate(
      {this.companyName,
      this.firstName,
      this.lastName,
      this.street,
      this.houseNumber,
      this.postalCode,
      this.city,
      this.countryIso2,
      this.gender,
      this.genderText,
      this.country,
      this.language,
      this.packId,
      this.telephone,
      this.vatNumber,
      this.nameZahlungsempfaenger});

  SubscriberUpdate.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    street = json['street'];
    houseNumber = json['houseNumber'];
    postalCode = json['postalCode'];
    city = json['city'];
    countryIso2 = json['countryIso2'];
    gender = json['gender'];
    genderText = json['genderText'];
    country = json['country'];
    language = json['language'];
    packId = json['packId'];
    telephone = json['telephone'];
    vatNumber = json['vatNumber'];
    nameZahlungsempfaenger = json['nameZahlungsempfaenger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['street'] = this.street;
    data['houseNumber'] = this.houseNumber;
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['countryIso2'] = this.countryIso2;
    data['gender'] = this.gender;
    data['genderText'] = this.genderText;
    data['country'] = this.country;
    data['language'] = this.language;
    data['packId'] = this.packId;
    data['telephone'] = this.telephone;
    data['vatNumber'] = this.vatNumber;
    data['nameZahlungsempfaenger'] = this.nameZahlungsempfaenger;
    return data;
  }
}

class SubscriberResponse {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? postalCode;
  String? houseNumber;
  String? houseNumberAdd;
  String? street;
  String? city;
  String? countryIso2;
  String? language;
  String? telephone;
  String? vatNumber;
  Null? bIC;
  String? nameZahlungsempfaenger;
  String? createdAt;
  String? updatedAt;
  String? gender;

  SubscriberResponse(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.postalCode,
      this.houseNumber,
      this.houseNumberAdd,
      this.street,
      this.city,
      this.countryIso2,
      this.language,
      this.telephone,
      this.vatNumber,
      this.bIC,
      this.nameZahlungsempfaenger,
      this.createdAt,
      this.updatedAt,
      this.gender});

  SubscriberResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    postalCode = json['postalCode'];
    houseNumber = json['houseNumber'];
    houseNumberAdd = json['houseNumberAdd'];
    street = json['street'];
    city = json['city'];
    countryIso2 = json['countryIso2'];
    language = json['language'];
    telephone = json['telephone'];
    vatNumber = json['vatNumber'];
    bIC = json['BIC'];
    nameZahlungsempfaenger = json['nameZahlungsempfaenger'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['postalCode'] = this.postalCode;
    data['houseNumber'] = this.houseNumber;
    data['houseNumberAdd'] = this.houseNumberAdd;
    data['street'] = this.street;
    data['city'] = this.city;
    data['countryIso2'] = this.countryIso2;
    data['language'] = this.language;
    data['telephone'] = this.telephone;
    data['vatNumber'] = this.vatNumber;
    data['BIC'] = this.bIC;
    data['nameZahlungsempfaenger'] = this.nameZahlungsempfaenger;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['gender'] = this.gender;
    return data;
  }
}
