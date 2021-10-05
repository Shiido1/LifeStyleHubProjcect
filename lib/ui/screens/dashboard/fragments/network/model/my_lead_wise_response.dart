
class MyLeadWiseResponse {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MyLeadWiseResponse({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  MyLeadWiseResponse.fromJson(Map<String, dynamic> json) {
    if(json["current_page"] is int)
      this.currentPage = json["current_page"];
    if(json["data"] is List)
      this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>Data.fromJson(e)).toList();
    if(json["first_page_url"] is String)
      this.firstPageUrl = json["first_page_url"];
    if(json["from"] is int)
      this.from = json["from"];
    if(json["last_page"] is int)
      this.lastPage = json["last_page"];
    if(json["last_page_url"] is String)
      this.lastPageUrl = json["last_page_url"];
    if(json["links"] is List)
      this.links = json["links"]==null ? null : (json["links"] as List).map((e)=>Links.fromJson(e)).toList();
    if(json["next_page_url"] is String)
      this.nextPageUrl = json["next_page_url"];
    if(json["path"] is String)
      this.path = json["path"];
    if(json["per_page"] is int)
      this.perPage = json["per_page"];
    if(json["prev_page_url"] is String)
      this.prevPageUrl = json["prev_page_url"];
    if(json["to"] is int)
      this.to = json["to"];
    if(json["total"] is int)
      this.total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_page"] = this.currentPage;
    if(this.data != null)
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    data["first_page_url"] = this.firstPageUrl;
    data["from"] = this.from;
    data["last_page"] = this.lastPage;
    data["last_page_url"] = this.lastPageUrl;
    if(this.links != null)
      data["links"] = this.links?.map((e)=>e.toJson()).toList();
    data["next_page_url"] = this.nextPageUrl;
    data["path"] = this.path;
    data["per_page"] = this.perPage;
    data["prev_page_url"] = this.prevPageUrl;
    data["to"] = this.to;
    data["total"] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String)
      this.url = json["url"];
    if(json["label"] is String)
      this.label = json["label"];
    if(json["active"] is bool)
      this.active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url"] = this.url;
    data["label"] = this.label;
    data["active"] = this.active;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
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

  Data({this.id, this.name, this.email, this.emailVerifiedAt, this.phoneNo, this.countryId, this.state, this.address, this.sex, this.dob, this.profilePic, this.status, this.referredBy, this.affiliateId, this.trialEnds, this.isAdmin, this.role, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if(json["phone_no"] is String)
      this.phoneNo = json["phone_no"];
    if(json["country_id"] is int)
      this.countryId = json["country_id"];
    if(json["state"] is String)
      this.state = json["state"];
    if(json["address"] is String)
      this.address = json["address"];
    if(json["sex"] is String)
      this.sex = json["sex"];
    if(json["dob"] is String)
      this.dob = json["dob"];
    if(json["profile_pic"] is String)
      this.profilePic = json["profile_pic"];
    if(json["status"] is String)
      this.status = json["status"];
    if(json["referred_by"] is String)
      this.referredBy = json["referred_by"];
    if(json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null ? null : AffiliateId.fromJson(json["affiliate_id"]);
    if(json["trial_ends"] is String)
      this.trialEnds = json["trial_ends"];
    if(json["is_admin"] is int)
      this.isAdmin = json["is_admin"];
    if(json["role"] is String)
      this.role = json["role"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
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
    if(this.affiliateId != null)
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
    if(json["code"] is String)
      this.code = json["code"];
    if(json["link"] is String)
      this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}