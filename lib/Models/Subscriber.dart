class Subscriber {
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
  String? bIC;
  String? nameZahlungsempfaenger;
  String? createdAt;
  String? updatedAt;
  String? gender;

  Subscriber(
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

  Subscriber.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['postalCode'] = postalCode;
    data['houseNumber'] = houseNumber;
    data['houseNumberAdd'] = houseNumberAdd;
    data['street'] = street;
    data['city'] = city;
    data['countryIso2'] = countryIso2;
    data['language'] = language;
    data['telephone'] = telephone;
    data['vatNumber'] = vatNumber;
    data['BIC'] = bIC;
    data['nameZahlungsempfaenger'] = nameZahlungsempfaenger;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['gender'] = gender;
    return data;
  }
}
