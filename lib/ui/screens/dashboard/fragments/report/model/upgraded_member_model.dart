
class UpgradedMemberModel {
  List<UpgradedMembers>? upgradedMembers;
  List<dynamic>? analytics;

  UpgradedMemberModel({this.upgradedMembers, this.analytics});

  UpgradedMemberModel.fromJson(Map<String, dynamic> json) {
    if(json["upgraded_members"] is List)
      this.upgradedMembers = json["upgraded_members"]==null ? null : (json["upgraded_members"] as List).map((e)=>UpgradedMembers.fromJson(e)).toList();
    if(json["analytics"] is List)
      this.analytics = json["analytics"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.upgradedMembers != null)
      data["upgraded_members"] = this.upgradedMembers?.map((e)=>e.toJson()).toList();
    if(this.analytics != null)
      data["analytics"] = this.analytics;
    return data;
  }
}

class UpgradedMembers {
  String? date;
  String? name;
  String? phoneNo;
  String? package;
  String? medium;
  int? commission;
  String? status;

  UpgradedMembers({this.date, this.name, this.phoneNo, this.package, this.medium, this.commission, this.status});

  UpgradedMembers.fromJson(Map<String, dynamic> json) {
    if(json["date"] is String)
      this.date = json["date"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["phone_no"] is String)
      this.phoneNo = json["phone_no"];
    if(json["package"] is String)
      this.package = json["package"];
    if(json["medium"] is String)
      this.medium = json["medium"];
    if(json["commission"] is int)
      this.commission = json["commission"];
    if(json["status"] is String)
      this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["name"] = this.name;
    data["phone_no"] = this.phoneNo;
    data["package"] = this.package;
    data["medium"] = this.medium;
    data["commission"] = this.commission;
    data["status"] = this.status;
    return data;
  }
}