
class CommissionModel {
  int? totalCommission;
  List<CommissionHistory>? commissionHistory;

  CommissionModel({this.totalCommission, this.commissionHistory});

  CommissionModel.fromJson(Map<String, dynamic> json) {
    if(json["total_commission"] is int)
      this.totalCommission = json["total_commission"];
    if(json["commission_history"] is List)
      this.commissionHistory = json["commission_history"]==null ? null : (json["commission_history"] as List).map((e)=>CommissionHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["total_commission"] = this.totalCommission;
    if(this.commissionHistory != null)
      data["commission_history"] = this.commissionHistory?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class CommissionHistory {
  String? fullname;
  String? email;
  String? referredBy;
  String? package;
  int? amount;
  String? date;

  CommissionHistory({this.fullname, this.email, this.referredBy, this.package, this.amount, this.date});

  CommissionHistory.fromJson(Map<String, dynamic> json) {
    if(json["fullname"] is String)
      this.fullname = json["fullname"];
    if(json["email"] is String)
      this.email = json["email"];
    if(json["referred_by"] is String)
      this.referredBy = json["referred_by"];
    if(json["package"] is String)
      this.package = json["package"];
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
    data["package"] = this.package;
    data["amount"] = this.amount;
    data["date"] = this.date;
    return data;
  }
}