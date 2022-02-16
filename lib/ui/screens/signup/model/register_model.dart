// class RegisterModel {
//   User? user;
//   Wallet? wallet;
//   String? token;

//   RegisterModel({this.user, this.wallet, this.token});

//   RegisterModel.fromJson(Map<String, dynamic> json) {
//     if (json["user"] is Map)
//       this.user = json["user"] == null ? null : User.fromJson(json["user"]);
//     if (json["wallet"] is Map)
//       this.wallet =
//           json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]);
//     if (json["token"] is String) this.token = json["token"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) data["user"] = this.user?.toJson();
//     if (this.wallet != null) data["wallet"] = this.wallet?.toJson();
//     data["token"] = this.token;
//     return data;
//   }

  // static Map<String, dynamic> sendData(
  //     {required String email,
  //     required String password,
  //     required String passwordConfirmation,
  //     required String referral}) {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data["email"] = email;
  //   data["password"] = password;
  //   data["password_confirmation"] = passwordConfirmation;
  //   data["referral_code"] = referral;
  //   return data;
  // }
// }

// class Wallet {
//   int? id;
//   int? userId;
//   int? totalIncome;
//   int? totalCredit;
//   int? totalDebit;
//   int? balance;
//   String? createdAt;
//   String? updatedAt;

//   Wallet(
//       {this.id,
//       this.userId,
//       this.totalIncome,
//       this.totalCredit,
//       this.totalDebit,
//       this.balance,
//       this.createdAt,
//       this.updatedAt});

//   Wallet.fromJson(json) {
//     if (json["id"] is int) this.id = json["id"];
//     if (json["user_id"] is int) this.userId = json["user_id"];
//     if (json["total_income"] is int) this.totalIncome = json["total_income"];
//     if (json["total_credit"] is int) this.totalCredit = json["total_credit"];
//     if (json["total_debit"] is int) this.totalDebit = json["total_debit"];
//     if (json["balance"] is int) this.balance = json["balance"];
//     if (json["created_at"] is String) this.createdAt = json["created_at"];
//     if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["id"] = this.id;
//     data["user_id"] = this.userId;
//     data["total_income"] = this.totalIncome;
//     data["total_credit"] = this.totalCredit;
//     data["total_debit"] = this.totalDebit;
//     data["balance"] = this.balance;
//     data["created_at"] = this.createdAt;
//     data["updated_at"] = this.updatedAt;
//     return data;
//   }
// }

// class User {
//   String? email;
//   String? trialEnds;
//   String? referredBy;
//   AffiliateId? affiliateId;
//   String? updatedAt;
//   String? createdAt;
//   int? id;

//   User(
//       {this.email,
//       this.trialEnds,
//       this.referredBy,
//       this.affiliateId,
//       this.updatedAt,
//       this.createdAt,
//       this.id});

//   User.fromJson(Map<String, dynamic> json) {
//     if (json["email"] is String) this.email = json["email"];
//     if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
//     if (json["referred_by"] is String) this.referredBy = json["referred_by"];
//     if (json["affiliate_id"] is Map)
//       this.affiliateId = json["affiliate_id"] == null
//           ? null
//           : AffiliateId.fromJson(json["affiliate_id"]);
//     if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
//     if (json["created_at"] is String) this.createdAt = json["created_at"];
//     if (json["id"] is int) this.id = json["id"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["email"] = this.email;
//     data["trial_ends"] = this.trialEnds;
//     data["referred_by"] = this.referredBy;
//     if (this.affiliateId != null)
//       data["affiliate_id"] = this.affiliateId?.toJson();
//     data["updated_at"] = this.updatedAt;
//     data["created_at"] = this.createdAt;
//     data["id"] = this.id;
//     return data;
//   }
// }

// class AffiliateId {
//   String? code;
//   String? link;

//   AffiliateId({this.code, this.link});

//   AffiliateId.fromJson(Map<String, dynamic> json) {
//     if (json["code"] is String) this.code = json["code"];
//     if (json["link"] is String) this.link = json["link"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["code"] = this.code;
//     data["link"] = this.link;
//     return data;
//   }
// }

class RegisterModel {
  User? user;
  String? token;

  RegisterModel({this.user, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
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

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? countryId;
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
  List<Wallets>? wallets;

  User(
      {this.id,
      this.name,
      this.username,
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
      this.wallets});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNo = json['phone_no'];
    countryId = json['country_id'];
    state = json['state'];
    address = json['address'];
    sex = json['sex'];
    dob = json['dob'];
    profilePic = json['profile_pic'];
    status = json['status'];
    referredBy = json['referred_by'];
    affiliateId = json['affiliate_id'] != null
        ? new AffiliateId.fromJson(json['affiliate_id'])
        : null;
    trialEnds = json['trial_ends'];
    isAdmin = json['is_admin'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['wallets'] != null) {
      wallets = <Wallets>[];
      json['wallets'].forEach((v) {
        wallets!.add(new Wallets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_no'] = this.phoneNo;
    data['country_id'] = this.countryId;
    data['state'] = this.state;
    data['address'] = this.address;
    data['sex'] = this.sex;
    data['dob'] = this.dob;
    data['profile_pic'] = this.profilePic;
    data['status'] = this.status;
    data['referred_by'] = this.referredBy;
    if (this.affiliateId != null) {
      data['affiliate_id'] = this.affiliateId!.toJson();
    }
    data['trial_ends'] = this.trialEnds;
    data['is_admin'] = this.isAdmin;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.wallets != null) {
      data['wallets'] = this.wallets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AffiliateId {
  String? code;
  String? link;

  AffiliateId({this.code, this.link});

  AffiliateId.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['link'] = this.link;
    return data;
  }
}

class Wallets {
  int? id;
  int? userId;
  String? type;
  int? totalCredit;
  int? totalDebit;
  int? balance;
  String? createdAt;
  String? updatedAt;

  Wallets(
      {this.id,
      this.userId,
      this.type,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  Wallets.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    totalCredit = json['total_credit'];
    totalDebit = json['total_debit'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['total_credit'] = this.totalCredit;
    data['total_debit'] = this.totalDebit;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
