class PointHistoryModel {
  String? pointBalance;
  PointHistory? pointHistory;
  List<PointBreakdown>? pointBreakdown;

  PointHistoryModel(
      {this.pointBalance, this.pointHistory, this.pointBreakdown});

  PointHistoryModel.fromJson(json) {
    if (json == null) return;
    if (json["point_balance"] is String)
      this.pointBalance = json["point_balance"];
    if (json["point_history"] is Map)
      this.pointHistory = json["point_history"] == null
          ? null
          : PointHistory.fromJson(json["point_history"]);
    if (json["point_breakdown"] is List)
      this.pointBreakdown = json["point_breakdown"] == null
          ? null
          : (json["point_breakdown"] as List)
              .map((e) => PointBreakdown.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["point_balance"] = this.pointBalance;
    if (this.pointHistory != null)
      data["point_history"] = this.pointHistory?.toJson();
    if (this.pointBreakdown != null)
      data["point_breakdown"] =
          this.pointBreakdown?.map((e) => e.toJson()).toList();
    return data;
  }
}

class PointBreakdown {
  String? packageIcon;
  String? packageName;
  String? reward;
  int? checkoutPoints;

  PointBreakdown(
      {this.packageIcon, this.packageName, this.reward, this.checkoutPoints});

  PointBreakdown.fromJson(Map<String, dynamic> json) {
    if (json["package_icon"] is String) this.packageIcon = json["package_icon"];
    if (json["package_name"] is String) this.packageName = json["package_name"];
    if (json["reward"] is String) this.reward = json["reward"];
    if (json["checkout_points"] is int)
      this.checkoutPoints = json["checkout_points"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["package_icon"] = this.packageIcon;
    data["package_name"] = this.packageName;
    data["reward"] = this.reward;
    data["checkout_points"] = this.checkoutPoints;
    return data;
  }
}

class PointHistory {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  PointHistory(
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

  PointHistory.fromJson(json) {
    if (json["current_page"] is int) this.currentPage = json["current_page"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
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
    this.nextPageUrl = json["next_page_url"];
    if (json["path"] is String) this.path = json["path"];
    if (json["per_page"] is int) this.perPage = json["per_page"];
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
  dynamic? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    this.url = json["url"];
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
  String? date;
  String? name;
  String? email;
  String? package;
  String? points;

  Data({this.date, this.name, this.email, this.package, this.points});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) this.date = json["date"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["package"] is String) this.package = json["package"];
    if (json["points"] is String) this.points = json["points"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["name"] = this.name;
    data["email"] = this.email;
    data["package"] = this.package;
    data["points"] = this.points;
    return data;
  }
}
