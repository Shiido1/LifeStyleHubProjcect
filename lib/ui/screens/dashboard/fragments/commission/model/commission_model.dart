class CommissionModel {
  double? totalCommission;
  int? claimedCommission;
  CommissionHistory? commissionHistory;

  CommissionModel(
      {this.totalCommission, this.claimedCommission, this.commissionHistory});

  CommissionModel.fromJson(Map<String, dynamic> json) {
    totalCommission = json['total_commission'];
    claimedCommission = json['claimed_commission'];
    commissionHistory = json['commission_history'] != null
        ? new CommissionHistory.fromJson(json['commission_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_commission'] = this.totalCommission;
    data['claimed_commission'] = this.claimedCommission;
    if (this.commissionHistory != null) {
      data['commission_history'] = this.commissionHistory!.toJson();
    }
    return data;
  }
}

class CommissionHistory {
  int? currentPage;
  List<Data>? data;
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

  CommissionHistory(
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

  CommissionHistory.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? fullname;
  String? email;
  String? referredBy;
  String? packageIcon;
  String? packageName;
  double? amount;
  String? date;

  Data(
      {this.fullname,
      this.email,
      this.referredBy,
      this.packageIcon,
      this.packageName,
      this.amount,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    referredBy = json['referred_by'];
    packageIcon = json['package_icon'];
    packageName = json['package_name'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['referred_by'] = this.referredBy;
    data['package_icon'] = this.packageIcon;
    data['package_name'] = this.packageName;
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}