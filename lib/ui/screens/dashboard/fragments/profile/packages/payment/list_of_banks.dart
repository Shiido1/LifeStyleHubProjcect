class LSHBankResponseList {
  List<LshBankResponse>? list;

  LSHBankResponseList({this.list});

  factory LSHBankResponseList.fromJson(List<dynamic> parsedJson) {
    List<LshBankResponse> viewContesModelList = [];
    viewContesModelList =
        parsedJson.map((i) => LshBankResponse.fromJson(i)).toList();

    return LSHBankResponseList(list: viewContesModelList);
  }
}

class LshBankResponse {
  int? id;
  String? name;
  String? accountName;
  String? accountNo;
  String? currency;
  String? createdAt;
  String? updatedAt;

  LshBankResponse(
      {this.id,
      this.name,
      this.accountName,
      this.accountNo,
      this.currency,
      this.createdAt,
      this.updatedAt});

  LshBankResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["account_name"] is String) this.accountName = json["account_name"];
    if (json["account_no"] is String) this.accountNo = json["account_no"];
    if (json["currency"] is String) this.currency = json["currency"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["account_name"] = this.accountName;
    data["account_no"] = this.accountNo;
    data["currency"] = this.currency;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
