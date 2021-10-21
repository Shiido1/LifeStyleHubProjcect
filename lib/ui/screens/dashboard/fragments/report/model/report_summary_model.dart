
class ReportPromotionSummaryModel {
  int? totalFreeTrialMembers;
  int? totalUpgradedMembers;
  int? totalCommission;

  ReportPromotionSummaryModel({this.totalFreeTrialMembers, this.totalUpgradedMembers, this.totalCommission});

  ReportPromotionSummaryModel.fromJson(Map<String, dynamic> json) {
    if(json["total_free_trial_members"] is int)
      this.totalFreeTrialMembers = json["total_free_trial_members"];
    if(json["total_upgraded_members"] is int)
      this.totalUpgradedMembers = json["total_upgraded_members"];
    if(json["total_commission"] is int)
      this.totalCommission = json["total_commission"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["total_free_trial_members"] = this.totalFreeTrialMembers;
    data["total_upgraded_members"] = this.totalUpgradedMembers;
    data["total_commission"] = this.totalCommission;
    return data;
  }
}