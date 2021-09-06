class PointHistoryModel {
  String? pointBalance;
  List<PointHistory>? pointHistory;
  List<PointBreakdown>? pointBreakdown;

  PointHistoryModel(
      {this.pointBalance, this.pointHistory, this.pointBreakdown});

  PointHistoryModel.fromJson(json) {
    if (json["point_balance"] is String)
      this.pointBalance = json["point_balance"];
    if (json["point_history"] is List)
      this.pointHistory = json["point_history"] == null
          ? null
          : (json["point_history"] as List)
              .map((e) => PointHistory.fromJson(e))
              .toList();
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
      data["point_history"] =
          this.pointHistory?.map((e) => e.toJson()).toList();
    if (this.pointBreakdown != null)
      data["point_breakdown"] =
          this.pointBreakdown?.map((e) => e.toJson()).toList();

    return data;
  }
}

class PointHistory {
  String? date;
  String? name;
  String? email;
  String? package;
  String? points;

  PointHistory({this.date, this.name, this.email, this.package, this.points});

  PointHistory.fromJson(json) {
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

class PointBreakdown {
  String? packageIcon;
  String? packageName;
  String? reward;
  int? checkoutPoints;

  PointBreakdown(
      {this.packageIcon, this.packageName, this.reward, this.checkoutPoints});

  PointBreakdown.fromJson(json) {
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
