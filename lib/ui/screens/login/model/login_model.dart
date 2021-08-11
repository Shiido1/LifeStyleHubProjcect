class LoginModel {
  User? user;
  Wallet? wallet;
  String? token;

  LoginModel({this.user, this.wallet, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    if (json["wallet"] is Map)
      this.wallet =
          json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]);
    if (json["token"] is String) this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) data["user"] = this.user?.toJson();
    if (this.wallet != null) data["wallet"] = this.wallet?.toJson();
    data["token"] = this.token;
    return data;
  }

  static Map<String, dynamic> sendData(
      {required String email, required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["email"] = email;
    data["password"] = password;
    return data;
  }
}

class Wallet {
  int? id;
  int? userId;
  int? totalIncome;
  int? totalCredit;
  int? totalDebit;
  int? balance;
  String? createdAt;
  String? updatedAt;

  Wallet(
      {this.id,
      this.userId,
      this.totalIncome,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["total_income"] is int) this.totalIncome = json["total_income"];
    if (json["total_credit"] is int) this.totalCredit = json["total_credit"];
    if (json["total_debit"] is int) this.totalDebit = json["total_debit"];
    if (json["balance"] is int) this.balance = json["balance"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["total_income"] = this.totalIncome;
    data["total_credit"] = this.totalCredit;
    data["total_debit"] = this.totalDebit;
    data["balance"] = this.balance;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  dynamic? name;
  String? email;
  dynamic? emailVerifiedAt;
  dynamic? phoneNo;
  dynamic? state;
  dynamic? address;
  dynamic? sex;
  dynamic? dob;
  String? status;
  dynamic? referredBy;
  AffiliateId? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    this.phoneNo = json["phone_no"];
    this.state = json["state"];
    this.address = json["address"];
    this.sex = json["sex"];
    this.dob = json["dob"];
    if (json["status"] is String) this.status = json["status"];
    this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
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
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId {
  String? code;
  String? link;

  AffiliateId({this.code, this.link});

  AffiliateId.fromJson(Map<String, dynamic> json) {
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
