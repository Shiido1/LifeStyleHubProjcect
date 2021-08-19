import 'dart:convert' as convert;

import 'package:lifestyle_hub/helper/configs/instances.dart';

class GetResourcesModelList {
  final List<GetResourcesModel>? getResourceModel;

  GetResourcesModelList({
    this.getResourceModel,
  });

  factory GetResourcesModelList.fromJson(List<dynamic> parsedJson) {
    List<GetResourcesModel> getResourceModel = [];
    getResourceModel =
        parsedJson.map((i) => GetResourcesModel.fromJson(i)).toList();

    return GetResourcesModelList(getResourceModel: getResourceModel);
  }
}

class GetResourcesModel {
  int? id;
  String? title;
  String? slug;
  String? featuredImage;
  String? type;
  Content? content;
  String? createdAt;
  String? updatedAt;

  GetResourcesModel(
      {this.id,
      this.title,
      this.slug,
      this.featuredImage,
      this.type,
      this.content,
      this.createdAt,
      this.updatedAt});

  GetResourcesModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["featured_image"] is String)
      this.featuredImage = json["featured_image"];
    if (json["type"] is String) this.type = json["type"];
    if (json["content"] is String)
      this.content = Content.fromJson(convert.json.decode(json["content"]));
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["slug"] = this.slug;
    data["featured_image"] = this.featuredImage;
    data["type"] = this.type;
    data["content"] = this.content;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class Content {
  List<dynamic>? body;
  String? path;

  Content({this.body, this.path});

  Content.fromJson(Map<String, dynamic> json) {
    if (json["body"] is List) this.body = json["body"] ?? [];
    if (json["path"] is String) this.path = json["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) data["body"] = this.body;
    data["path"] = this.path;
    return data;
  }
}
