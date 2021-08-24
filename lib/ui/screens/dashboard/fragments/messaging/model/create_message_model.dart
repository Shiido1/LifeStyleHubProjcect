class CreateMessageModelList {
  final List<CreateMessageModel>? getBankAccountModel;

  CreateMessageModelList({this.getBankAccountModel});

  factory CreateMessageModelList.fromJson(List<dynamic> parsedJson) {
    List<CreateMessageModel> getBankAccountModelList = [];
    getBankAccountModelList =
        parsedJson.map((i) => CreateMessageModel.fromJson(i)).toList();

    return CreateMessageModelList(getBankAccountModel: getBankAccountModelList);
  }
}

class CreateMessageModel {
  List<dynamic>? data;
  bool? directMessage;
  String? updatedAt;
  String? createdAt;
  int? id;

  CreateMessageModel(
      {this.data, this.directMessage, this.updatedAt, this.createdAt, this.id});

  CreateMessageModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) this.data = json["data"] ?? [];
    if (json["direct_message"] is bool)
      this.directMessage = json["direct_message"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) data["data"] = this.data;
    data["direct_message"] = this.directMessage;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}
