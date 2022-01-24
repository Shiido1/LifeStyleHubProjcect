class ReportPromotionIncomeAnalysisModelList {
  List<PackageSignupBonus>? packageSignupBonus;
  List<Null>? leadershipBonus;
  List<Null>? ecommerceReferral;

  ReportPromotionIncomeAnalysisModelList(
      {this.packageSignupBonus, this.leadershipBonus, this.ecommerceReferral});

  ReportPromotionIncomeAnalysisModelList.fromJson(Map<String, dynamic> json) {
    if (json['package_signup_bonus'] != null) {
      packageSignupBonus = <PackageSignupBonus>[];
      json['package_signup_bonus'].forEach((v) {
        packageSignupBonus!.add(new PackageSignupBonus.fromJson(v));
      });
    }
    if (json['leadership_bonus'] != null) {
      leadershipBonus = <Null>[];
      json['leadership_bonus'].forEach((v) {
        leadershipBonus!.add((v));
      });
    }
    if (json['ecommerce_referral'] != null) {
      ecommerceReferral = <Null>[];
      json['ecommerce_referral'].forEach((v) {
        ecommerceReferral!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.packageSignupBonus != null) {
      data['package_signup_bonus'] =
          this.packageSignupBonus!.map((v) => v.toJson()).toList();
    }
    if (this.leadershipBonus != null) {
      data['leadership_bonus'] =
          this.leadershipBonus!.map((v) => v).toList();
    }
    if (this.ecommerceReferral != null) {
      data['ecommerce_referral'] =
          this.ecommerceReferral!.map((v) => v).toList();
    }
    return data;
  }
}

class PackageSignupBonus {
  int? year;
  int? month;
  int? amount;

  PackageSignupBonus({this.year, this.month, this.amount});

  PackageSignupBonus.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['amount'] = this.amount;
    return data;
  }
}
