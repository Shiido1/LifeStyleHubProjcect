
class PointHistoryModel {
  String? pointBalance;
  List<PointHistory>? pointHistory;

  PointHistoryModel({this.pointBalance, this.pointHistory});

  PointHistoryModel.fromJson(Map<String, dynamic> json) {
    if(json["point_balance"] is String)
      this.pointBalance = json["point_balance"];
    if(json["point_history"] is List)
      this.pointHistory = json["point_history"]==null ? null : (json["point_history"] as List).map((e)=>PointHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["point_balance"] = this.pointBalance;
    if(this.pointHistory != null)
      data["point_history"] = this.pointHistory?.map((e)=>e.toJson()).toList();
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

  PointHistory.fromJson(Map<String, dynamic> json) {
    if(json["date"] is String)
      this.date = json["date"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["package"] is String)
      this.package = json["package"];
    if(json["points"] is String)
      this.points = json["points"];
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