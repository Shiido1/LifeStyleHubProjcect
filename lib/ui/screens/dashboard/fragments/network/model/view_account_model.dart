class ViewAccountResponseList {
  List<ViewAccountResponse>? viewAccountResponseList;

  ViewAccountResponseList({this.viewAccountResponseList});

  factory ViewAccountResponseList.fromJson(List<dynamic> parsedJson) {
    List<ViewAccountResponse> views = [];
    views = parsedJson.map((i) => ViewAccountResponse.fromJson(i)).toList();

    return ViewAccountResponseList(viewAccountResponseList: views);
  }
}

class ViewAccountResponse {
  int? id;
  int? userId;
  int? packageId;
  int? referredBy;
  int? parentId;
  String? points;
  String? status;
  String? createdAt;
  String? updatedAt;
  Package? package;

  ViewAccountResponse(
      {this.id,
      this.userId,
      this.packageId,
      this.referredBy,
      this.parentId,
      this.points,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.package});

  ViewAccountResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["package_id"] is int) this.packageId = json["package_id"];
    if (json["referred_by"] is int) this.referredBy = json["referred_by"];
    if (json["parent_id"] is int) this.parentId = json["parent_id"];
    if (json["points"] is String) this.points = json["points"];
    if (json["status"] is String) this.status = json["status"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["package"] is Map)
      this.package =
          json["package"] == null ? null : Package.fromJson(json["package"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["package_id"] = this.packageId;
    data["referred_by"] = this.referredBy;
    data["parent_id"] = this.parentId;
    data["points"] = this.points;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.package != null) data["package"] = this.package?.toJson();
    return data;
  }
}

class Package {
  int? id;
  String? name;
  String? type;
  int? generations;
  int? downlines;
  String? subscription;
  String? description;
  dynamic? image;
  int? uplinePointAcc;
  int? referralPoints;
  int? directBonus;
  int? leadershipBonus;
  int? checkoutPoints;
  int? value;
  String? rewards;
  dynamic? terms;
  String? createdAt;
  String? updatedAt;

  Package(
      {this.id,
      this.name,
      this.type,
      this.generations,
      this.downlines,
      this.subscription,
      this.description,
      this.image,
      this.uplinePointAcc,
      this.referralPoints,
      this.directBonus,
      this.leadershipBonus,
      this.checkoutPoints,
      this.value,
      this.rewards,
      this.terms,
      this.createdAt,
      this.updatedAt});

  Package.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["type"] is String) this.type = json["type"];
    if (json["generations"] is int) this.generations = json["generations"];
    if (json["downlines"] is int) this.downlines = json["downlines"];
    if (json["subscription"] is String)
      this.subscription = json["subscription"];
    if (json["description"] is String) this.description = json["description"];
    this.image = json["image"];
    if (json["upline_point_acc"] is int)
      this.uplinePointAcc = json["upline_point_acc"];
    if (json["referral_points"] is int)
      this.referralPoints = json["referral_points"];
    if (json["direct_bonus"] is int) this.directBonus = json["direct_bonus"];
    if (json["leadership_bonus"] is int)
      this.leadershipBonus = json["leadership_bonus"];
    if (json["checkout_points"] is int)
      this.checkoutPoints = json["checkout_points"];
    if (json["value"] is int) this.value = json["value"];
    if (json["rewards"] is String) this.rewards = json["rewards"];
    this.terms = json["terms"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["type"] = this.type;
    data["generations"] = this.generations;
    data["downlines"] = this.downlines;
    data["subscription"] = this.subscription;
    data["description"] = this.description;
    data["image"] = this.image;
    data["upline_point_acc"] = this.uplinePointAcc;
    data["referral_points"] = this.referralPoints;
    data["direct_bonus"] = this.directBonus;
    data["leadership_bonus"] = this.leadershipBonus;
    data["checkout_points"] = this.checkoutPoints;
    data["value"] = this.value;
    data["rewards"] = this.rewards;
    data["terms"] = this.terms;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
