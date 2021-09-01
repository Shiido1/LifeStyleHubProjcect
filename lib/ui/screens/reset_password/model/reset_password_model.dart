class ResetPasswordModel {
  String? status;

  ResetPasswordModel({this.status});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    return data;
  }
}
