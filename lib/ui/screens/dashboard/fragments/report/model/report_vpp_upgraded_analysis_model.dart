class VVPUpgradedAnalysisModel {
  UpgradedMembers? upgradedMembers;
  VppAnalytics? vppAnalytics;

  VVPUpgradedAnalysisModel({this.upgradedMembers, this.vppAnalytics});

  VVPUpgradedAnalysisModel.fromJson(Map<String, dynamic> json) {
    upgradedMembers = json['upgraded_members'] != null
        ? new UpgradedMembers.fromJson(json['upgraded_members'])
        : null;
    vppAnalytics = json['vpp_analytics'] != null
        ? new VppAnalytics.fromJson(json['vpp_analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.upgradedMembers != null) {
      data['upgraded_members'] = this.upgradedMembers!.toJson();
    }
    if (this.vppAnalytics != null) {
      data['vpp_analytics'] = this.vppAnalytics!.toJson();
    }
    return data;
  }
}

class UpgradedMembers {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null nextPageUrl;
  String? path;
  int? perPage;
  Null prevPageUrl;
  int? to;
  int? total;

  UpgradedMembers(
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

  UpgradedMembers.fromJson(Map<String, dynamic> json) {
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
  String? phoneNo;
  String? package;
  String? medium;
  int? amount;
  String? status;

  Data(
      {this.date,
      this.name,
      this.phoneNo,
      this.package,
      this.medium,
      this.amount,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    phoneNo = json['phone_no'];
    package = json['package'];
    medium = json['medium'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['name'] = this.name;
    data['phone_no'] = this.phoneNo;
    data['package'] = this.package;
    data['medium'] = this.medium;
    data['amount'] = this.amount;
    data['status'] = this.status;
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

class VppAnalytics {
  List<Vpp>? vpp;
  int? totalSignups;
  int? totalCommission;

  VppAnalytics({this.vpp, this.totalSignups, this.totalCommission});

  VppAnalytics.fromJson(Map<String, dynamic> json) {
    if (json['vpp'] != null) {
      vpp = <Vpp>[];
      json['vpp'].forEach((v) {
        vpp!.add(new Vpp.fromJson(v));
      });
    }
    totalSignups = json['total_signups'];
    totalCommission = json['total_commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vpp != null) {
      data['vpp'] = this.vpp!.map((v) => v.toJson()).toList();
    }
    data['total_signups'] = this.totalSignups;
    data['total_commission'] = this.totalCommission;
    return data;
  }
}

class Vpp {
  String? name;
  int? signups;
  int? commission;

  Vpp({this.name, this.signups, this.commission});

  Vpp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    signups = json['signups'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['signups'] = this.signups;
    data['commission'] = this.commission;
    return data;
  }
}