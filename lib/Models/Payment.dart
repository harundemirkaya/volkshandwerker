class AppPaymentResponse {
  int? status;
  bool? success;
  String? message;

  AppPaymentResponse({this.status, this.success, this.message});

  AppPaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
