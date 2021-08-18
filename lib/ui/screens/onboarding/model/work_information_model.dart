class WorkInformationModel {
  Work? work;
  Bank? bank;
  String? message;

  WorkInformationModel({this.work, this.bank, this.message});

  WorkInformationModel.fromJson(Map<String, dynamic> json) {
    if (json["work"] is Map)
      this.work = json["work"] == null ? null : Work.fromJson(json["work"]);
    if (json["bank"] is Map)
      this.bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.work != null) data["work"] = this.work?.toJson();
    if (this.bank != null) data["bank"] = this.bank?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Bank {
  int? userId;
  String? name;
  String? accountName;
  String? accountNo;
  dynamic? sortCode;
  dynamic? swiftCode;
  String? updatedAt;
  String? createdAt;
  int? id;

  Bank(
      {this.userId,
      this.name,
      this.accountName,
      this.accountNo,
      this.sortCode,
      this.swiftCode,
      this.updatedAt,
      this.createdAt,
      this.id});

  Bank.fromJson(Map<String, dynamic> json) {
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["account_name"] is String) this.accountName = json["account_name"];
    if (json["account_no"] is String) this.accountNo = json["account_no"];
    this.sortCode = json["sort_code"];
    this.swiftCode = json["swift_code"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_id"] = this.userId;
    data["name"] = this.name;
    data["account_name"] = this.accountName;
    data["account_no"] = this.accountNo;
    data["sort_code"] = this.sortCode;
    data["swift_code"] = this.swiftCode;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}

class Work {
  int? userId;
  String? occupation;
  String? industry;
  String? address;
  String? updatedAt;
  String? createdAt;
  int? id;

  Work(
      {this.userId,
      this.occupation,
      this.industry,
      this.address,
      this.updatedAt,
      this.createdAt,
      this.id});

  Work.fromJson(Map<String, dynamic> json) {
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["occupation"] is String) this.occupation = json["occupation"];
    if (json["industry"] is String) this.industry = json["industry"];
    if (json["address"] is String) this.address = json["address"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_id"] = this.userId;
    data["occupation"] = this.occupation;
    data["industry"] = this.industry;
    data["address"] = this.address;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}
