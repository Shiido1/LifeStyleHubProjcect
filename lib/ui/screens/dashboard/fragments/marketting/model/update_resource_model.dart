class UpdateResourceModel {
  Resource? resource;
  String? message;

  UpdateResourceModel({this.resource, this.message});

  UpdateResourceModel.fromJson(Map<String, dynamic> json) {
    if (json["resource"] is Map)
      this.resource =
          json["resource"] == null ? null : Resource.fromJson(json["resource"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resource != null) data["resource"] = this.resource?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Resource {
  int? id;
  String? title;
  String? slug;
  String? featuredImage;
  String? type;
  String? content;
  String? createdAt;
  String? updatedAt;

  Resource(
      {this.id,
      this.title,
      this.slug,
      this.featuredImage,
      this.type,
      this.content,
      this.createdAt,
      this.updatedAt});

  Resource.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["featured_image"] is String)
      this.featuredImage = json["featured_image"];
    if (json["type"] is String) this.type = json["type"];
    if (json["content"] is String) this.content = json["content"];
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
