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
  Null? bIC;
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
