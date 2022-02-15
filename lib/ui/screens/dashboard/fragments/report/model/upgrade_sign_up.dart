class UpgradedSignUpList {
  final List<UpgradeSignUpModel>? upgrade;

  UpgradedSignUpList({
    this.upgrade,
  });

  factory UpgradedSignUpList.fromJson(List<dynamic> parsedJson) {
    List<UpgradeSignUpModel> upgrade = [];

    upgrade = parsedJson.map((i) => UpgradeSignUpModel.fromJson(i)).toList();
    return new UpgradedSignUpList(
      upgrade: upgrade,
    );
  }
}

class UpgradeSignUpModel {
  String? year;
  String? month;
  int? signups;
  double? income;

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
