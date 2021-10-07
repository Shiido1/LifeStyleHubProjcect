class WithdrawModel {
  String? amount;
  String? bankId;
  String? purpose;
  int? userId;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  WithdrawModel(
      {this.amount,
      this.bankId,
      this.purpose,
      this.userId,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  WithdrawModel.fromJson(Map<String, dynamic> json) {
    if (json["amount"] is String) this.amount = json["amount"];
    if (json["bank_id"] is String) this.bankId = json["bank_id"];
    if (json["purpose"] is String) this.purpose = json["purpose"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["status"] is String) this.status = json["status"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["amount"] = this.amount;
    data["bank_id"] = this.bankId;
    data["purpose"] = this.purpose;
    data["user_id"] = this.userId;
    data["status"] = this.status;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}
