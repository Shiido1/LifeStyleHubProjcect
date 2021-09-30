
class CommissionModel {
  int? totalCommission;
  CommissionHistory? commissionHistory;

  CommissionModel({this.totalCommission, this.commissionHistory});

  CommissionModel.fromJson(Map<String, dynamic> json) {
    if(json["total_commission"] is int)
      this.totalCommission = json["total_commission"];
    if(json["commission_history"] is Map)
      this.commissionHistory = json["commission_history"] == null ? null : CommissionHistory.fromJson(json["commission_history"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["total_commission"] = this.totalCommission;
    if(this.commissionHistory != null)
      data["commission_history"] = this.commissionHistory?.toJson();
    return data;
  }
}

class CommissionHistory {
  int? currentPage;
  List<Data>? data = [];
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

  CommissionHistory({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  CommissionHistory.fromJson(Map<String, dynamic> json) {
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
    this.nextPageUrl = json["next_page_url"];
    if(json["path"] is String)
      this.path = json["path"];
    if(json["per_page"] is int)
      this.perPage = json["per_page"];
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
  dynamic? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
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
  String? fullname;
  String? email;
  String? referredBy;
  String? packageIcon;
  String? packageName;
  int? amount;
  String? date;

  Data({this.fullname, this.email, this.referredBy, this.packageIcon, this.packageName, this.amount, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["fullname"] is String)
      this.fullname = json["fullname"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["referred_by"] is String)
      this.referredBy = json["referred_by"];
    if(json["package_icon"] is String)
      this.packageIcon = json["package_icon"];
    if(json["package_name"] is String)
      this.packageName = json["package_name"];
    if(json["amount"] is int)
      this.amount = json["amount"];
    if(json["date"] is String)
      this.date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["fullname"] = this.fullname;
    data["email"] = this.email;
    data["referred_by"] = this.referredBy;
    data["package_icon"] = this.packageIcon;
    data["package_name"] = this.packageName;
    data["amount"] = this.amount;
    data["date"] = this.date;
    return data;
  }
}