class DashboardModel {
  String? name;
  int? walletBalance;
  int? incomeReceived;
  int? referralLinkSignup;
  int? upgradedMembers;
  String? pointBalance;
  FeaturedVideo? featuredVideo;
  FeaturedContest? featuredContest;
  List<dynamic>? recentDownlines;
  String? referralLink;
  List<Resources>? resources;

  DashboardModel(
      {this.name,
      this.walletBalance,
      this.incomeReceived,
      this.referralLinkSignup,
      this.upgradedMembers,
      this.pointBalance,
      this.featuredVideo,
      this.featuredContest,
      this.recentDownlines,
      this.referralLink,
      this.resources});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
    if (json["wallet_balance"] is int)
      this.walletBalance = json["wallet_balance"];
    if (json["income_received"] is int)
      this.incomeReceived = json["income_received"];
    if (json["referral_link_signup"] is int)
      this.referralLinkSignup = json["referral_link_signup"];
    if (json["upgraded_members"] is int)
      this.upgradedMembers = json["upgraded_members"];
    if (json["point_balance"] is String)
      this.pointBalance = json["point_balance"];
    if (json["featured_video"] is Map)
      this.featuredVideo = json["featured_video"] == null
          ? null
          : FeaturedVideo.fromJson(json["featured_video"]);
    if (json["featured_contest"] is Map)
      this.featuredContest = json["featured_contest"] == null
          ? null
          : FeaturedContest.fromJson(json["featured_contest"]);
    if (json["recent_downlines"] is List)
      this.recentDownlines = json["recent_downlines"] ?? [];
    if (json["referral_link"] is String)
      this.referralLink = json["referral_link"];
    if (json["resources"] is List)
      this.resources = json["resources"] == null
          ? null
          : (json["resources"] as List)
              .map((e) => Resources.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["wallet_balance"] = this.walletBalance;
    data["income_received"] = this.incomeReceived;
    data["referral_link_signup"] = this.referralLinkSignup;
    data["upgraded_members"] = this.upgradedMembers;
    data["point_balance"] = this.pointBalance;
    if (this.featuredVideo != null)
      data["featured_video"] = this.featuredVideo?.toJson();
    if (this.featuredContest != null)
      data["featured_contest"] = this.featuredContest?.toJson();
    if (this.recentDownlines != null)
      data["recent_downlines"] = this.recentDownlines;
    data["referral_link"] = this.referralLink;
    if (this.resources != null)
      data["resources"] = this.resources?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Resources {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? featuredImage;
  String? type;
  Content1? content;
  int? featured;
  String? createdAt;
  String? updatedAt;

  Resources(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.featuredImage,
      this.type,
      this.content,
      this.featured,
      this.createdAt,
      this.updatedAt});

  Resources.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["description"] is String) this.description = json["description"];
    if (json["featured_image"] is String)
      this.featuredImage = json["featured_image"];
    if (json["type"] is String) this.type = json["type"];
    if (json["content"] is Map)
      this.content =
          json["content"] == null ? null : Content1.fromJson(json["content"]);
    if (json["featured"] is int) this.featured = json["featured"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["slug"] = this.slug;
    data["description"] = this.description;
    data["featured_image"] = this.featuredImage;
    data["type"] = this.type;
    if (this.content != null) data["content"] = this.content?.toJson();
    data["featured"] = this.featured;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Content1 {
  String? path;

  Content1({this.path});

  Content1.fromJson(Map<String, dynamic> json) {
    if (json["path"] is String) this.path = json["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["path"] = this.path;
    return data;
  }
}

class FeaturedContest {
  int? id;
  String? name;
  String? description;
  String? startdate;
  String? enddate;
  int? directsRequired;
  String? image;
  String? reward;
  int? featured;
  String? createdAt;
  String? updatedAt;
  int? directsReferred;

  FeaturedContest(
      {this.id,
      this.name,
      this.description,
      this.startdate,
      this.enddate,
      this.directsRequired,
      this.image,
      this.reward,
      this.featured,
      this.createdAt,
      this.updatedAt,
      this.directsReferred});

  FeaturedContest.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["description"] is String) this.description = json["description"];
    if (json["startdate"] is String) this.startdate = json["startdate"];
    if (json["enddate"] is String) this.enddate = json["enddate"];
    if (json["directs_required"] is int)
      this.directsRequired = json["directs_required"];
    if (json["image"] is String) this.image = json["image"];
    if (json["reward"] is String) this.reward = json["reward"];
    if (json["featured"] is int) this.featured = json["featured"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["directs_referred"] is int)
      this.directsReferred = json["directs_referred"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["startdate"] = this.startdate;
    data["enddate"] = this.enddate;
    data["directs_required"] = this.directsRequired;
    data["image"] = this.image;
    data["reward"] = this.reward;
    data["featured"] = this.featured;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["directs_referred"] = this.directsReferred;
    return data;
  }
}

class FeaturedVideo {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? featuredImage;
  String? type;
  Content? content;
  int? featured;
  String? createdAt;
  String? updatedAt;

  FeaturedVideo(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.featuredImage,
      this.type,
      this.content,
      this.featured,
      this.createdAt,
      this.updatedAt});

  FeaturedVideo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["description"] is String) this.description = json["description"];
    if (json["featured_image"] is String)
      this.featuredImage = json["featured_image"];
    if (json["type"] is String) this.type = json["type"];
    if (json["content"] is Map)
      this.content =
          json["content"] == null ? null : Content.fromJson(json["content"]);
    if (json["featured"] is int) this.featured = json["featured"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["slug"] = this.slug;
    data["description"] = this.description;
    data["featured_image"] = this.featuredImage;
    data["type"] = this.type;
    if (this.content != null) data["content"] = this.content?.toJson();
    data["featured"] = this.featured;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Content {
  String? path;

  Content({this.path});

  Content.fromJson(Map<String, dynamic> json) {
    if (json["path"] is String) this.path = json["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["path"] = this.path;
    return data;
  }
}
