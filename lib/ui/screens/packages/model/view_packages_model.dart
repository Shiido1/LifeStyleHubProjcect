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
  int? referralPoints;
  int? referralBonus;
  int? checkoutPoints;
  int? value;
  String? createdAt;
  String? updatedAt;

  ViewPackagesModel({this.id, this.name, this.type, this.generations, this.downlines, this.subscription, this.description, this.referralPoints, this.referralBonus, this.checkoutPoints, this.value, this.createdAt, this.updatedAt});

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
    if(json["referral_points"] is int)
      this.referralPoints = json["referral_points"];
    if(json["referral_bonus"] is int)
      this.referralBonus = json["referral_bonus"];
    if(json["checkout_points"] is int)
      this.checkoutPoints = json["checkout_points"];
    if(json["value"] is int)
      this.value = json["value"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
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
    data["referral_points"] = this.referralPoints;
    data["referral_bonus"] = this.referralBonus;
    data["checkout_points"] = this.checkoutPoints;
    data["value"] = this.value;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
