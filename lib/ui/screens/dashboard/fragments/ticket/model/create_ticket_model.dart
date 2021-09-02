class CreateTicketModel {
  Ticket? ticket;
  String? message;

  CreateTicketModel({this.ticket, this.message});

  CreateTicketModel.fromJson(Map<String, dynamic> json) {
    if (json["ticket"] is Map)
      this.ticket =
          json["ticket"] == null ? null : Ticket.fromJson(json["ticket"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ticket != null) data["ticket"] = this.ticket?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class Ticket {
  String? subject;
  String? departmentId;
  String? priority;
  String? message;
  int? userId;
  String? ticketId;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Ticket(
      {this.subject,
      this.departmentId,
      this.priority,
      this.message,
      this.userId,
      this.ticketId,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  Ticket.fromJson(Map<String, dynamic> json) {
    if (json["subject"] is String) this.subject = json["subject"];
    if (json["department_id"] is String)
      this.departmentId = json["department_id"];
    if (json["priority"] is String) this.priority = json["priority"];
    if (json["message"] is String) this.message = json["message"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["ticket_id"] is String) this.ticketId = json["ticket_id"];
    if (json["status"] is String) this.status = json["status"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["subject"] = this.subject;
    data["department_id"] = this.departmentId;
    data["priority"] = this.priority;
    data["message"] = this.message;
    data["user_id"] = this.userId;
    data["ticket_id"] = this.ticketId;
    data["status"] = this.status;
    data["updated_at"] = this.updatedAt;
    data["created_at"] = this.createdAt;
    data["id"] = this.id;
    return data;
  }
}
