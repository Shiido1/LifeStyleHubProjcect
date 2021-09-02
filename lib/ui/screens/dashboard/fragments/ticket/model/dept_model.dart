class DepartmentModelList {
  List<DepartmentModel>? dList;

  DepartmentModelList({this.dList});

  factory DepartmentModelList.fromJson(List<dynamic> parsedJson) {
    List<DepartmentModel> photos = [];
    photos = parsedJson.map((i) => DepartmentModel.fromJson(i)).toList();

    return new DepartmentModelList(
      dList: photos,
    );
  }
}

class DepartmentModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  DepartmentModel({this.id, this.name, this.createdAt, this.updatedAt});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
