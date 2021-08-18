class AddBankAccountModel {
  Bank? bank;
  String? message;

  AddBankAccountModel({this.bank, this.message});

  AddBankAccountModel.fromJson(Map<String, dynamic> json) {
    if (json["bank"] is Map)
      this.bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bank != null) data["bank"] = this.bank?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Bank {
  String? name;
  String? accountName;
  String? accountNo;
  String? currency;
  String? updatedAt;
  String? createdAt;
  int? id;

  Bank(
      {this.name,
      this.accountName,
      this.accountNo,
      this.currency,
      this.updatedAt,
      this.createdAt,
      this.id});

  Bank.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
    if (json["account_name"] is String) this.accountName = json["account_name"];
    if (json["account_no"] is String) this.accountNo = json["account_no"];
    if (json["currency"] is String) this.currency = json["currency"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["account_name"] = this.accountName;
    data["account_no"] = this.accountNo;
    data["currency"] = this.currency;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}
