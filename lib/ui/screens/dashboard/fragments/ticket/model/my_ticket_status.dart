class MyTicketStatusModel {
  int? open;
  int? answered;
  int? replied;
  int? closed;

  MyTicketStatusModel({this.open, this.answered, this.replied, this.closed});

  MyTicketStatusModel.fromJson(Map<String, dynamic> json) {
    if (json["open"] is int) this.open = json["open"];
    if (json["answered"] is int) this.answered = json["answered"];
    if (json["replied"] is int) this.replied = json["replied"];
    if (json["closed"] is int) this.closed = json["closed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["open"] = this.open;
    data["answered"] = this.answered;
    data["replied"] = this.replied;
    data["closed"] = this.closed;
    return data;
  }
}
