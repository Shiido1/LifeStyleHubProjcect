class RegisterModel {
  User? user;
  Wallet? wallet;
  String? token;

  RegisterModel({this.user, this.wallet, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
      {required String email,
      required String password,
      required String passwordConfirmation,
      required String referral}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = email;
    data["password"] = password;
    data["password_confirmation"] = passwordConfirmation;
    data["referral_code"] = referral;
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
  String? email;
  String? trialEnds;
  String? referredBy;
  AffiliateId? affiliateId;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.email,
      this.trialEnds,
      this.referredBy,
      this.affiliateId,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) this.email = json["email"];
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["trial_ends"] = this.trialEnds;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
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
