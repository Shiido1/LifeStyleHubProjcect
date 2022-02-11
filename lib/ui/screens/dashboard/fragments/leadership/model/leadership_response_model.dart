class LeaderShipResponseModel {
  List<Leaderships>? leaderships;

  LeaderShipResponseModel({this.leaderships});

  LeaderShipResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['leaderships'] != null) {
      leaderships = <Leaderships>[];
      json['leaderships'].forEach((v) {
        leaderships!.add(new Leaderships.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leaderships != null) {
      data['leaderships'] = this.leaderships!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leaderships {
  int? id;
  String? title;
  String? slug;
  String? task;
  String? icon;
  Requirements? requirements;
  List<String>? reward;
  String? createdAt;
  String? updatedAt;
  int? progress;

  Leaderships(
      {this.id,
      this.title,
      this.slug,
      this.task,
      this.icon,
      this.requirements,
      this.reward,
      this.createdAt,
      this.updatedAt,
      this.progress});

  Leaderships.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    task = json['task'];
    icon = json['icon'];
    requirements = json['requirements'] != null
        ? new Requirements.fromJson(json['requirements'])
        : null;
    reward = json['reward'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['task'] = this.task;
    data['icon'] = this.icon;
    if (this.requirements != null) {
      data['requirements'] = this.requirements!.toJson();
    }
    data['reward'] = this.reward;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['progress'] = this.progress;
    return data;
  }
}

class Requirements {
  String? text;
  int? qualify;
  String? s1stGenQualifiers;

  Requirements({this.text, this.qualify, this.s1stGenQualifiers});

  Requirements.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    qualify = json['qualify'];
    s1stGenQualifiers = json['1st_gen_qualifiers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['qualify'] = this.qualify;
    data['1st_gen_qualifiers'] = this.s1stGenQualifiers;
    return data;
  }
}