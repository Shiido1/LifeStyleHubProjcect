
class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(Map<dynamic, dynamic> json) {
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
      {required String email, required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = email;
    data["password"] = password;
    data["role"] = 'user';
    return data;
  }
}

class User {
  dynamic id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  dynamic countryId;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? profilePic;
  String? status;
  String? referredBy;
  AffiliateId? affiliateId;
  String? trialEnds;
  dynamic isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  List<Banks>? banks;
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
      this.banks,
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
    if (json['banks'] != null) {
      banks = <Banks>[];
      json['banks'].forEach((v) {
        banks!.add(new Banks.fromJson(v));
      });
    }
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
    if (this.banks != null) {
      data['banks'] = this.banks!.map((v) => v.toJson()).toList();
    }
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

class Banks {
  dynamic id;
  dynamic userId;
  String? name;
  String? accountName;
  String? accountNo;
  String? currency;
  String? sortCode;
  String? swiftCode;
  String? createdAt;
  String? updatedAt;

  Banks(
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

  Banks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    accountName = json['account_name'];
    accountNo = json['account_no'];
    currency = json['currency'];
    sortCode = json['sort_code'];
    swiftCode = json['swift_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['account_name'] = this.accountName;
    data['account_no'] = this.accountNo;
    data['currency'] = this.currency;
    data['sort_code'] = this.sortCode;
    data['swift_code'] = this.swiftCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Wallets {
  dynamic id;
  dynamic userId;
  String? type;
  dynamic totalCredit;
  dynamic totalDebit;
  dynamic balance;
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
