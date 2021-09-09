class ViewPackagesModelList {
  final List<ViewPackagesModel>? viewPackagesModel;

  ViewPackagesModelList({
    this.viewPackagesModel,
  });

  factory ViewPackagesModelList.fromJson(List<dynamic> parsedJson) {
    List<ViewPackagesModel> _viewPackagesModel = [];
    _viewPackagesModel =
        parsedJson.map((i) => ViewPackagesModel.fromJson(i)).toList();

    return ViewPackagesModelList(viewPackagesModel: _viewPackagesModel);
  }
}


class ViewPackagesModel {
  int? id;
  String? name;
  String? type;
  int? generations;
  int? downlines;
  String? subscription;
  String? description;
  int? uplinePointAcc;
  int? referralPoints;
  int? directBonus;
  int? leadershipBonus;
  int? checkoutPoints;
  int? value;
  String? rewards;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? terms;

  ViewPackagesModel({this.id, this.name, this.type, this.generations, this.downlines, this.subscription, this.description, this.uplinePointAcc, this.referralPoints, this.directBonus, this.leadershipBonus, this.checkoutPoints, this.value, this.rewards, this.createdAt, this.updatedAt, this.image, this.terms});

  ViewPackagesModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["type"] is String)
      this.type = json["type"];
    if(json["generations"] is int)
      this.generations = json["generations"];
    if(json["downlines"] is int)
      this.downlines = json["downlines"];
    if(json["subscription"] is String)
      this.subscription = json["subscription"];
    if(json["description"] is String)
      this.description = json["description"];
    if(json["upline_point_acc"] is int)
      this.uplinePointAcc = json["upline_point_acc"];
    if(json["referral_points"] is int)
      this.referralPoints = json["referral_points"];
    if(json["direct_bonus"] is int)
      this.directBonus = json["direct_bonus"];
    if(json["leadership_bonus"] is int)
      this.leadershipBonus = json["leadership_bonus"];
    if(json["checkout_points"] is int)
      this.checkoutPoints = json["checkout_points"];
    if(json["value"] is int)
      this.value = json["value"];
    if(json["rewards"] is String)
      this.rewards = json["rewards"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["image"] is String)
      this.image = json["image"];
    if(json["terms"] is String)
      this.terms = json["terms"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["type"] = this.type;
    data["generations"] = this.generations;
    data["downlines"] = this.downlines;
    data["subscription"] = this.subscription;
    data["description"] = this.description;
    data["upline_point_acc"] = this.uplinePointAcc;
    data["referral_points"] = this.referralPoints;
    data["direct_bonus"] = this.directBonus;
    data["leadership_bonus"] = this.leadershipBonus;
    data["checkout_points"] = this.checkoutPoints;
    data["value"] = this.value;
    data["rewards"] = this.rewards;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["image"] = this.image;
    data["terms"] = this.terms;
    return data;
  }
}