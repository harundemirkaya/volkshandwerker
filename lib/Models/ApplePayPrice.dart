class ApplePayPrice {
  String? label;
  String? amount;
  String? status;
  String? type;

  ApplePayPrice({this.label, this.amount, this.status, this.type});

  ApplePayPrice.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    amount = json['amount'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['type'] = this.type;
    return data;
  }
}
