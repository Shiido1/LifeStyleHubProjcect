
class Sadad {
  Bank bank;
  String message;

  Sadad({this.bank, this.message});

  Sadad.fromJson(Map<String, dynamic> json) {
    this.bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.bank != null)
      data["bank"] = this.bank.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Bank {
  String name;
  String accountName;
  String accountNo;
  String currency;
  String updatedAt;
  String createdAt;
  int id;

  Bank({this.name, this.accountName, this.accountNo, this.currency, this.updatedAt, this.createdAt, this.id});

  Bank.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.accountName = json["account_name"];
    this.accountNo = json["account_no"];
    this.currency = json["currency"];
    this.updatedAt = json["updated_at"];
    this.createdAt = json["created_at"];
    this.id = json["id"];
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