class CreateOrUpdateContestModel {
  Contest? contest;
  String? message;

  CreateOrUpdateContestModel({this.contest, this.message});

  CreateOrUpdateContestModel.fromJson(Map<String, dynamic> json) {
    if (json["contest"] is Map)
      this.contest =
          json["contest"] == null ? null : Contest.fromJson(json["contest"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contest != null) data["contest"] = this.contest?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Contest {
  int? id;
  String? name;
  String? description;
  String? startdate;
  String? enddate;
  int? directsRequired;
  dynamic image;
  String? reward;
  String? createdAt;
  String? updatedAt;

  Contest(
      {this.id,
      this.name,
      this.description,
      this.startdate,
      this.enddate,
      this.directsRequired,
      this.image,
      this.reward,
      this.createdAt,
      this.updatedAt});

  Contest.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["description"] is String) this.description = json["description"];
    if (json["startdate"] is String) this.startdate = json["startdate"];
    if (json["enddate"] is String) this.enddate = json["enddate"];
    if (json["directs_required"] is int)
      this.directsRequired = json["directs_required"];
    this.image = json["image"];
    if (json["reward"] is String) this.reward = json["reward"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
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
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
