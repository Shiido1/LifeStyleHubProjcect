class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    if (json["token"] is String) this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) data["user"] = this.user?.toJson();
    data["token"] = this.token;
    return data;
  }

  static Map<String, dynamic> sendData(
      {required String email, required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = email;
    data["password"] = password;
    data["role"] = 'user';
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic? emailVerifiedAt;
  String? phoneNo;
  int? countryId;
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
  Wallet? wallet;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.countryId,
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
      this.wallet});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["country_id"] is int) this.countryId = json["country_id"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    if (json["profile_pic"] is String) this.profilePic = json["profile_pic"];
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
    if (json["wallet"] is Map)
      this.wallet =
          json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["country_id"] = this.countryId;
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
    if (this.wallet != null) data["wallet"] = this.wallet?.toJson();
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

class Bank {
  int? id;
  int? userId;
  String? name;
  String? accountName;
  String? accountNo;
  dynamic? currency;
  dynamic? sortCode;
  dynamic? swiftCode;
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

  Bank.fromJson(Map<String, dynamic> json) {
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
