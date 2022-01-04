class UsersProfileModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? profilePic;
  String? status;
  String? referredBy;
  AffiliateId? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  Bank? bank;
  Work? work;
  Nok? nok;

  UsersProfileModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.profilePic,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.bank,
      this.work,
      this.nok});

  UsersProfileModel.fromJson(json) {
    if (json == null) return;

    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    this.profilePic = json["profile_pic"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["bank"] is Map)
      this.bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    if (json["work"] is Map)
      this.work = json["work"] == null ? null : Work.fromJson(json["work"]);
    if (json["nok"] is Map)
      this.nok = json["nok"] == null ? null : Nok.fromJson(json["nok"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["state"] = this.state;
    data["address"] = this.address;
    data["sex"] = this.sex;
    data["dob"] = this.dob;
    data["profile_pic"] = this.profilePic;
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.bank != null) data["bank"] = this.bank?.toJson();
    if (this.work != null) data["work"] = this.work?.toJson();
    if (this.nok != null) data["nok"] = this.nok?.toJson();
    return data;
  }
}

class Nok {
  int? id;
  int? userId;
  String? name;
  String? relationship;
  String? phoneNo;
  String? email;
  String? createdAt;
  String? updatedAt;

  Nok(
      {this.id,
      this.userId,
      this.name,
      this.relationship,
      this.phoneNo,
      this.email,
      this.createdAt,
      this.updatedAt});

  Nok.fromJson(json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["relationship"] is String)
      this.relationship = json["relationship"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["email"] is String) this.email = json["email"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["name"] = this.name;
    data["relationship"] = this.relationship;
    data["phone_no"] = this.phoneNo;
    data["email"] = this.email;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Work {
  int? id;
  int? userId;
  String? occupation;
  String? industry;
  String? address;
  String? createdAt;
  String? updatedAt;

  Work(
      {this.id,
      this.userId,
      this.occupation,
      this.industry,
      this.address,
      this.createdAt,
      this.updatedAt});

  Work.fromJson(json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["occupation"] is String) this.occupation = json["occupation"];
    if (json["industry"] is String) this.industry = json["industry"];
    if (json["address"] is String) this.address = json["address"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["occupation"] = this.occupation;
    data["industry"] = this.industry;
    data["address"] = this.address;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Bank {
  int? id;
  int? userId;
  String? name;
  String? accountName;
  String? accountNo;
  dynamic currency;
  dynamic sortCode;
  dynamic swiftCode;
  String? createdAt;
  String? updatedAt;

  Bank(
      {this.id,
      this.userId,
      this.name,
      this.accountName,
      this.accountNo,
      this.currency,
      this.sortCode,
      this.swiftCode,
      this.createdAt,
      this.updatedAt});

  Bank.fromJson(json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["account_name"] is String) this.accountName = json["account_name"];
    if (json["account_no"] is String) this.accountNo = json["account_no"];
    this.currency = json["currency"];
    this.sortCode = json["sort_code"];
    this.swiftCode = json["swift_code"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["name"] = this.name;
    data["account_name"] = this.accountName;
    data["account_no"] = this.accountNo;
    data["currency"] = this.currency;
    data["sort_code"] = this.sortCode;
    data["swift_code"] = this.swiftCode;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId {
  String? code;
  String? link;

  AffiliateId({this.code, this.link});

  AffiliateId.fromJson(json) {
    if (json["code"] is String) this.code = json["code"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}
