class MyTicketReplyModel {
  Comment? comment;
  String? message;

  MyTicketReplyModel({this.comment, this.message});

  MyTicketReplyModel.fromJson(Map<String, dynamic> json) {
    if (json["comment"] is Map)
      this.comment =
          json["comment"] == null ? null : Comment.fromJson(json["comment"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comment != null) data["comment"] = this.comment?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Comment {
  int? ticketId;
  int? userId;
  String? comment;
  String? updatedAt;
  String? createdAt;
  int? id;
  Ticket? ticket;

  Comment(
      {this.ticketId,
      this.userId,
      this.comment,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.ticket});

  Comment.fromJson(Map<String, dynamic> json) {
    if (json["ticket_id"] is int) this.ticketId = json["ticket_id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["comment"] is String) this.comment = json["comment"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
    if (json["ticket"] is Map)
      this.ticket =
          json["ticket"] == null ? null : Ticket.fromJson(json["ticket"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ticket_id"] = this.ticketId;
    data["user_id"] = this.userId;
    data["comment"] = this.comment;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    if (this.ticket != null) data["ticket"] = this.ticket?.toJson();
    return data;
  }
}

class Ticket {
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
  User? user;

  Ticket(
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
      this.user});

  Ticket.fromJson(Map<String, dynamic> json) {
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
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
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
    if (this.user != null) data["user"] = this.user?.toJson();
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNo;
  String? state;
  String? address;
  String? sex;
  String? dob;
  String? status;
  String? referredBy;
  AffiliateId? affiliateId;
  String? trialEnds;
  int? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNo,
      this.state,
      this.address,
      this.sex,
      this.dob,
      this.status,
      this.referredBy,
      this.affiliateId,
      this.trialEnds,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["email_verified_at"] is String)
      this.emailVerifiedAt = json["email_verified_at"];
    if (json["phone_no"] is String) this.phoneNo = json["phone_no"];
    if (json["state"] is String) this.state = json["state"];
    if (json["address"] is String) this.address = json["address"];
    if (json["sex"] is String) this.sex = json["sex"];
    if (json["dob"] is String) this.dob = json["dob"];
    if (json["status"] is String) this.status = json["status"];
    if (json["referred_by"] is String) this.referredBy = json["referred_by"];
    if (json["affiliate_id"] is Map)
      this.affiliateId = json["affiliate_id"] == null
          ? null
          : AffiliateId.fromJson(json["affiliate_id"]);
    if (json["trial_ends"] is String) this.trialEnds = json["trial_ends"];
    if (json["is_admin"] is int) this.isAdmin = json["is_admin"];
    if (json["role"] is String) this.role = json["role"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["phone_no"] = this.phoneNo;
    data["state"] = this.state;
    data["address"] = this.address;
    data["sex"] = this.sex;
    data["dob"] = this.dob;
    data["status"] = this.status;
    data["referred_by"] = this.referredBy;
    if (this.affiliateId != null)
      data["affiliate_id"] = this.affiliateId?.toJson();
    data["trial_ends"] = this.trialEnds;
    data["is_admin"] = this.isAdmin;
    data["role"] = this.role;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class AffiliateId {
  String? code;
  String? link;

  AffiliateId({this.code, this.link});

  AffiliateId.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) this.code = json["code"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["link"] = this.link;
    return data;
  }
}
