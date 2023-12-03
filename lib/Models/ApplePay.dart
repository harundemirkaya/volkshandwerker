class ApplePayConfiguration {
  String? provider;
  Data? data;

  ApplePayConfiguration({this.provider, this.data});

  ApplePayConfiguration.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider'] = this.provider;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? merchantIdentifier;
  String? displayName;
  List<String>? merchantCapabilities;
  List<String>? supportedNetworks;
  String? countryCode;
  String? currencyCode;
  List<String>? requiredBillingContactFields;
  List<Null>? requiredShippingContactFields;
  List<Null>? shippingMethods;

  Data(
      {this.merchantIdentifier,
      this.displayName,
      this.merchantCapabilities,
      this.supportedNetworks,
      this.countryCode,
      this.currencyCode,
      this.requiredBillingContactFields,
      this.requiredShippingContactFields,
      this.shippingMethods});

  Data.fromJson(Map<String, dynamic> json) {
    merchantIdentifier = json['merchantIdentifier'];
    displayName = json['displayName'];
    merchantCapabilities = json['merchantCapabilities'].cast<String>();
    supportedNetworks = json['supportedNetworks'].cast<String>();
    countryCode = json['countryCode'];
    currencyCode = json['currencyCode'];
    requiredBillingContactFields =
        json['requiredBillingContactFields'].cast<String>();
    requiredShippingContactFields =
        json['requiredShippingContactFields'].cast<Null>();
    shippingMethods = json['shippingMethods'].cast<Null>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchantIdentifier'] = this.merchantIdentifier;
    data['displayName'] = this.displayName;
    data['merchantCapabilities'] = this.merchantCapabilities;
    data['supportedNetworks'] = this.supportedNetworks;
    data['countryCode'] = this.countryCode;
    data['currencyCode'] = this.currencyCode;
    data['requiredBillingContactFields'] = this.requiredBillingContactFields;
    data['requiredShippingContactFields'] = this.requiredShippingContactFields;
    data['shippingMethods'] = this.shippingMethods;
    return data;
  }
}
