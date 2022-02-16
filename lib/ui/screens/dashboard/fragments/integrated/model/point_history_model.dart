class PointHistoryModel {
  String? pointBalance;
  String? claimedPointBalance;
  PointHistory? pointHistory;
  List<PointBreakdown>? pointBreakdown;

  PointHistoryModel(
      {this.pointBalance,
      this.claimedPointBalance,
      this.pointHistory,
      this.pointBreakdown});

  PointHistoryModel.fromJson(Map<String, dynamic> json) {
    pointBalance = json['point_balance'];
    claimedPointBalance = json['claimed_point_balance'];
    pointHistory = json['point_history'] != null
        ? new PointHistory.fromJson(json['point_history'])
        : null;
    if (json['point_breakdown'] != null) {
      pointBreakdown = <PointBreakdown>[];
      json['point_breakdown'].forEach((v) {
        pointBreakdown!.add(new PointBreakdown.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['point_balance'] = this.pointBalance;
    data['claimed_point_balance'] = this.claimedPointBalance;
    if (this.pointHistory != null) {
      data['point_history'] = this.pointHistory!.toJson();
    }
    if (this.pointBreakdown != null) {
      data['point_breakdown'] =
          this.pointBreakdown!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PointHistory {
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

  PointHistory(
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

  PointHistory.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? name;
  String? email;
  String? package;
  String? type;
  String? points;

  Data(
      {this.date, this.name, this.email, this.package, this.type, this.points});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    email = json['email'];
    package = json['package'];
    type = json['type'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['name'] = this.name;
    data['email'] = this.email;
    data['package'] = this.package;
    data['type'] = this.type;
    data['points'] = this.points;
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

class PointBreakdown {
  int? accountId;
  String? packageIcon;
  String? packageName;
  String? reward;
  int? checkoutPoints;

  PointBreakdown(
      {this.accountId,
      this.packageIcon,
      this.packageName,
      this.reward,
      this.checkoutPoints});

  PointBreakdown.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    packageIcon = json['package_icon'];
    packageName = json['package_name'];
    reward = json['reward'];
    checkoutPoints = json['checkout_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['package_icon'] = this.packageIcon;
    data['package_name'] = this.packageName;
    data['reward'] = this.reward;
    data['checkout_points'] = this.checkoutPoints;
    return data;
  }
}