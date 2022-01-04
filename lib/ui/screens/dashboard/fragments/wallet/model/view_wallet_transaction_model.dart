class ViewWalletTransactionModel {
  WalletTransactions? walletTransactions;

  ViewWalletTransactionModel({this.walletTransactions});

  ViewWalletTransactionModel.fromJson(Map<String, dynamic> json) {
    if (json["wallet_transactions"] is Map)
      this.walletTransactions = json["wallet_transactions"] == null
          ? null
          : WalletTransactions.fromJson(json["wallet_transactions"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.walletTransactions != null)
      data["wallet_transactions"] = this.walletTransactions?.toJson();
    return data;
  }
}

class WalletTransactions {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  WalletTransactions(
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

  WalletTransactions.fromJson(Map<String, dynamic> json) {
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
    this.nextPageUrl = json["next_page_url"];
    if (json["path"] is String) this.path = json["path"];
    if (json["per_page"] is int) this.perPage = json["per_page"];
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
  dynamic url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    this.url = json["url"];
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
  int? walletId;
  String? referenceId;
  String? type;
  dynamic description;
  String? category;
  String? status;
  String? meta;
  int? amount;
  String? date;

  Data(
      {this.id,
      this.walletId,
      this.referenceId,
      this.type,
      this.description,
      this.category,
      this.status,
      this.meta,
      this.amount,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["wallet_id"] is int) this.walletId = json["wallet_id"];
    if (json["reference_id"] is String) this.referenceId = json["reference_id"];
    if (json["type"] is String) this.type = json["type"];
    this.description = json["description"];
    if (json["category"] is String) this.category = json["category"];
    if (json["status"] is String) this.status = json["status"];
    if (json["meta"] is String) this.meta = json["meta"];
    if (json["amount"] is int) this.amount = json["amount"];
    if (json["date"] is String) this.date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["wallet_id"] = this.walletId;
    data["reference_id"] = this.referenceId;
    data["type"] = this.type;
    data["description"] = this.description;
    data["category"] = this.category;
    data["status"] = this.status;
    data["meta"] = this.meta;
    data["amount"] = this.amount;
    data["date"] = this.date;
    return data;
  }
}
