class PackageSubcriptionResponseList {
  final List<PackageSubcriptionResponse>? packageList;

  PackageSubcriptionResponseList({this.packageList});

  factory PackageSubcriptionResponseList.fromJson(List<dynamic> parsedJson) {
    List<PackageSubcriptionResponse> _viewPackagesModel = [];
    _viewPackagesModel =
        parsedJson.map((i) => PackageSubcriptionResponse.fromJson(i)).toList();

    return PackageSubcriptionResponseList(packageList: _viewPackagesModel);
  }
}

class PackageSubcriptionResponse {
  int? id;
  String? name;
  String? type;
  int? generations;
  int? downlines;
  String? subscription;
  String? description;
  String? image;
  int? uplinePointAcc;
  int? referralPoints;
  int? directBonus;
  int? leadershipBonus;
  int? checkoutPoints;
  int? value;
  String? rewards;
  String? terms;
  String? createdAt;
  String? updatedAt;

  PackageSubcriptionResponse(
      {this.id,
      this.name,
      this.type,
      this.generations,
      this.downlines,
      this.subscription,
      this.description,
      this.image,
      this.uplinePointAcc,
      this.referralPoints,
      this.directBonus,
      this.leadershipBonus,
      this.checkoutPoints,
      this.value,
      this.rewards,
      this.terms,
      this.createdAt,
      this.updatedAt});

  PackageSubcriptionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    generations = json['generations'];
    downlines = json['downlines'];
    subscription = json['subscription'];
    description = json['description'];
    image = json['image'];
    uplinePointAcc = json['upline_point_acc'];
    referralPoints = json['referral_points'];
    directBonus = json['direct_bonus'];
    leadershipBonus = json['leadership_bonus'];
    checkoutPoints = json['checkout_points'];
    value = json['value'];
    rewards = json['rewards'];
    terms = json['terms'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['generations'] = this.generations;
    data['downlines'] = this.downlines;
    data['subscription'] = this.subscription;
    data['description'] = this.description;
    data['image'] = this.image;
    data['upline_point_acc'] = this.uplinePointAcc;
    data['referral_points'] = this.referralPoints;
    data['direct_bonus'] = this.directBonus;
    data['leadership_bonus'] = this.leadershipBonus;
    data['checkout_points'] = this.checkoutPoints;
    data['value'] = this.value;
    data['rewards'] = this.rewards;
    data['terms'] = this.terms;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}