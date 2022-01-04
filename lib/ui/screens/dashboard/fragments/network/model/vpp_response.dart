class VppResponse {
  Vpp? vpp;
  String? message;

  VppResponse({this.vpp, this.message});

  VppResponse.fromJson(Map<String, dynamic> json) {
    if (json["vpp"] is Map)
      this.vpp = json["vpp"] == null ? null : Vpp.fromJson(json["vpp"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vpp != null) data["vpp"] = this.vpp?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Vpp {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic phoneNo;
  int? countryId;
  dynamic state;
  dynamic address;
  dynamic sex;
  dynamic dob;
  String? profilePic;
  String? status;
  String? referredBy;
  AffiliateId? affiliateId;
  dynamic trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;

  Vpp(
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
      this.updatedAt});

  Vpp.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    this.emailVerifiedAt = json["email_verified_at"];
    this.phoneNo = json["phone_no"];
    if (json["country_id"] is int) this.countryId = json["country_id"];
    this.state = json["state"];
    this.address = json["address"];
    this.sex = json["sex"];
    this.dob = json["dob"];
    if (json["profile_pic"] is String) this.profilePic = json["profile_pic"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
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
