class BasicInformationModel {
  User? user;
  NextOfKin? nextOfKin;
  String? message;

  BasicInformationModel({this.user, this.nextOfKin, this.message});

  BasicInformationModel.fromJson(Map<String, dynamic> json) {
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
    if (json["next_of_kin"] is Map)
      this.nextOfKin = json["next_of_kin"] == null
          ? null
          : NextOfKin.fromJson(json["next_of_kin"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) data["user"] = this.user?.toJson();
    if (this.nextOfKin != null) data["next_of_kin"] = this.nextOfKin?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class NextOfKin {
  int? userId;
  String? name;
  String? relationship;
  String? phoneNo;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  NextOfKin(
      {this.userId,
      this.name,
      this.relationship,
      this.phoneNo,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  NextOfKin.fromJson(Map<String, dynamic> json) {
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["relationship"] is String)
      this.relationship = json["relationship"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["email"] is String) this.email = json["email"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_id"] = this.userId;
    data["name"] = this.name;
    data["relationship"] = this.relationship;
    data["phone_no"] = this.phoneNo;
    data["email"] = this.email;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? status;
  dynamic referredBy;
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
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
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
