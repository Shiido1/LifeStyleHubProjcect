class FreeMemberModel {
  List<FreeTrialMembers>? freeTrialMembers;
  List<dynamic>? analytics;

  FreeMemberModel({this.freeTrialMembers, this.analytics});

  FreeMemberModel.fromJson(Map<String, dynamic> json) {
    if (json["free_trial_members"] is List)
      this.freeTrialMembers = json["free_trial_members"] == null
          ? []
          : (json["free_trial_members"] as List)
              .map((e) => FreeTrialMembers.fromJson(e))
              .toList();
    if (json["analytics"] is List) this.analytics = json["analytics"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.freeTrialMembers != null)
      data["free_trial_members"] =
          this.freeTrialMembers?.map((e) => e.toJson()).toList();
    if (this.analytics != null) data["analytics"] = this.analytics;
    return data;
  }
}

class FreeTrialMembers {
  String? date;
  String? name;
  String? phoneNo;
  String? medium;

  FreeTrialMembers({this.date, this.name, this.phoneNo, this.medium});

  FreeTrialMembers.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) this.date = json["date"];
    if (json["name"] is String) this.name = json["name"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["medium"] is String) this.medium = json["medium"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["date"] = this.date;
    data["name"] = this.name;
    data["phone_no"] = this.phoneNo;
    data["medium"] = this.medium;
    return data;
  }
}
