class MyGenerationDownlineResponse {
  int? generationDownlineCount;
  GenerationDownline? generationDownline;

  MyGenerationDownlineResponse(
      {this.generationDownlineCount, this.generationDownline});

  MyGenerationDownlineResponse.fromJson(Map<String, dynamic> json) {
    if (json["generation_downline_count"] is int)
      this.generationDownlineCount = json["generation_downline_count"];
    if (json["generation_downline"] is Map)
      this.generationDownline = json["generation_downline"] == null
          ? null
          : GenerationDownline.fromJson(json["generation_downline"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["generation_downline_count"] = this.generationDownlineCount;
    if (this.generationDownline != null)
      data["generation_downline"] = this.generationDownline?.toJson();
    return data;
  }
}

class GenerationDownline {
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

  GenerationDownline(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  GenerationDownline.fromJson(Map<String, dynamic> json) {
    if (json["current_page"] is int) this.currentPage = json["current_page"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? []
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    if (json["first_page_url"] is String)
      this.firstPageUrl = json["first_page_url"];
    if (json["from"] is int) this.from = json["from"];
    if (json["last_page"] is int) this.lastPage = json["last_page"];
    if (json["last_page_url"] is String)
      this.lastPageUrl = json["last_page_url"];
    if (json["links"] is List)
      this.links = json["links"] == null
          ? null
          : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    if (json["next_page_url"] is String)
      this.nextPageUrl = json["next_page_url"];
    if (json["path"] is String) this.path = json["path"];
    if (json["per_page"] is int) this.perPage = json["per_page"];
    if (json["prev_page_url"] is String)
      this.prevPageUrl = json["prev_page_url"];
    if (json["to"] is int) this.to = json["to"];
    if (json["total"] is int) this.total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_page"] = this.currentPage;
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    data["first_page_url"] = this.firstPageUrl;
    data["from"] = this.from;
    data["last_page"] = this.lastPage;
    data["last_page_url"] = this.lastPageUrl;
    if (this.links != null)
      data["links"] = this.links?.map((e) => e.toJson()).toList();
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
    if (json["url"] is String) this.url = json["url"];
    if (json["label"] is String) this.label = json["label"];
    if (json["active"] is bool) this.active = json["active"];
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
  int? userId;
  int? packageId;
  int? referredBy;
  int? parentId;
  String? points;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Package? package;

  Data(
      {this.id,
      this.userId,
      this.packageId,
      this.referredBy,
      this.parentId,
      this.points,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.package});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["package_id"] is int) this.packageId = json["package_id"];
    if (json["referred_by"] is int) this.referredBy = json["referred_by"];
    if (json["parent_id"] is int) this.parentId = json["parent_id"];
    if (json["points"] is String) this.points = json["points"];
    if (json["status"] is String) this.status = json["status"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
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
    if (this.user != null) data["user"] = this.user?.toJson();
    if (this.package != null) data["package"] = this.package?.toJson();
    return data;
  }
}

class Package {
  String? name;

  Package({this.name});

  Package.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? referredBy;

  User({this.name, this.email, this.referredBy});

  User.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["referred_by"] = this.referredBy;
    return data;
  }
}
