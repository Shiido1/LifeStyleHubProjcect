class UpgradeSignUpModel {
  String? year;
  String? month;
  int? signups;
  int? income;

  UpgradeSignUpModel({this.year, this.month, this.signups, this.income});

  UpgradeSignUpModel.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    signups = json['signups'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['signups'] = this.signups;
    data['income'] = this.income;
    return data;
  }
}