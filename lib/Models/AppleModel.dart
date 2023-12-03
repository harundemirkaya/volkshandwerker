class AppleModel {
  String? config;
  Item? item;

  AppleModel({this.config, this.item});

  AppleModel.fromJson(Map<String, dynamic> json) {
    config = json['config'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['config'] = this.config;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  String? label;
  String? amount;
  String? status;
  String? type;

  Item({this.label, this.amount, this.status, this.type});

  Item.fromJson(Map<String, dynamic> json) {
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
