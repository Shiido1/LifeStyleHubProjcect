class MyTicketModel {
  int? currentPage;
  List<Data>? data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  MyTicketModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  MyTicketModel.fromJson(Map<String, dynamic> json) {
    if (json["current_page"] is int) this.currentPage = json["current_page"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    if (json["first_page_url"] is String)
      this.firstPageUrl = json["first_page_url"];
    if (json["from"] is int) this.from = json["from"];
    if (json["last_page"] is int) this.lastPage = json["last_page"];
    if (json["last_page_url"] is String)
      this.lastPageUrl = json["last_page_url"];
    if (json["links"] is List)
      this.links = json["links"] == null
          ? null
          : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    if (json["next_page_url"] is String)
      this.nextPageUrl = json["next_page_url"];
    if (json["path"] is String) this.path = json["path"];
    if (json["per_page"] is int) this.perPage = json["per_page"];
    if (json["prev_page_url"] is String)
      this.prevPageUrl = json["prev_page_url"];
    if (json["to"] is int) this.to = json["to"];
    if (json["total"] is int) this.total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_page"] = this.currentPage;
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    data["first_page_url"] = this.firstPageUrl;
    data["from"] = this.from;
    data["last_page"] = this.lastPage;
    data["last_page_url"] = this.lastPageUrl;
    if (this.links != null)
      data["links"] = this.links?.map((e) => e.toJson()).toList();
    data["next_page_url"] = this.nextPageUrl;
    data["path"] = this.path;
    data["per_page"] = this.perPage;
    data["prev_page_url"] = this.prevPageUrl;
    data["to"] = this.to;
    data["total"] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) this.url = json["url"];
    if (json["label"] is String) this.label = json["label"];
    if (json["active"] is bool) this.active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url"] = this.url;
    data["label"] = this.label;
    data["active"] = this.active;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? departmentId;
  String? ticketId;
  String? subject;
  String? message;
  String? priority;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? department;

  Data(
      {this.id,
      this.userId,
      this.departmentId,
      this.ticketId,
      this.subject,
      this.message,
      this.priority,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.department});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["department_id"] is int) this.departmentId = json["department_id"];
    if (json["ticket_id"] is String) this.ticketId = json["ticket_id"];
    if (json["subject"] is String) this.subject = json["subject"];
    if (json["message"] is String) this.message = json["message"];
    if (json["priority"] is String) this.priority = json["priority"];
    if (json["status"] is String) this.status = json["status"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["department"] is String) this.department = json["department"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["department_id"] = this.departmentId;
    data["ticket_id"] = this.ticketId;
    data["subject"] = this.subject;
    data["message"] = this.message;
    data["priority"] = this.priority;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["department"] = this.department;
    return data;
  }
}
