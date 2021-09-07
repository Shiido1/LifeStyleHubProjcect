class PackagesPaymentModel {
  String? message;

  PackagesPaymentModel({this.message});

  PackagesPaymentModel.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["message"] = this.message;
    return data;
  }
}
