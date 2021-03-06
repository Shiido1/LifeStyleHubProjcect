class ViewContestModelList {
  List<ViewContestModel>? viewContestModelList;

  ViewContestModelList({this.viewContestModelList});

  factory ViewContestModelList.fromJson(List<dynamic> parsedJson) {
    List<ViewContestModel> viewContesModelList = [];
    viewContesModelList =
        parsedJson.map((i) => ViewContestModel.fromJson(i)).toList();

    return ViewContestModelList(viewContestModelList: viewContesModelList);
  }
}

class ViewContestModel {
  int? id;
  String? name;
  String? description;
  String? startdate;
  String? enddate;
  int? directsRequired;
  String? image;
  String? reward;
  int? featured;
  String? createdAt;
  String? updatedAt;
  int? directsReferred;

  ViewContestModel({this.id, this.name, this.description, this.startdate, this.enddate, this.directsRequired, this.image, this.reward, this.featured, this.createdAt, this.updatedAt, this.directsReferred});

  ViewContestModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["description"] is String)
      this.description = json["description"];
    if(json["startdate"] is String)
      this.startdate = json["startdate"];
    if(json["enddate"] is String)
      this.enddate = json["enddate"];
    if(json["directs_required"] is int)
      this.directsRequired = json["directs_required"];
    if(json["image"] is String)
      this.image = json["image"];
    if(json["reward"] is String)
      this.reward = json["reward"];
    if(json["featured"] is int)
      this.featured = json["featured"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["directs_referred"] is int)
      this.directsReferred = json["directs_referred"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["startdate"] = this.startdate;
    data["enddate"] = this.enddate;
    data["directs_required"] = this.directsRequired;
    data["image"] = this.image;
    data["reward"] = this.reward;
    data["featured"] = this.featured;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["directs_referred"] = this.directsReferred;
    return data;
  }
}