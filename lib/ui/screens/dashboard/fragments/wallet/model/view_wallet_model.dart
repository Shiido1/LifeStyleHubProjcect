class ViewWalletModel {
  List<Wallets>? wallets = [];
  dynamic withdrawn;

  ViewWalletModel({this.wallets, this.withdrawn});

  ViewWalletModel.fromJson(Map<String, dynamic> json) {
    if (json['wallets'] != null) {
      wallets = <Wallets>[];
      json['wallets'].forEach((v) {
        wallets!.add(new Wallets.fromJson(v));
      });
    }
    withdrawn = json['withdrawn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallets != null) {
      data['wallets'] = this.wallets!.map((v) => v.toJson()).toList();
    }
    data['withdrawn'] = this.withdrawn;
    return data;
  }
}

class Wallets {
  int? id;
  int? userId;
  String? type;
  dynamic totalCredit;
  dynamic totalDebit;
  dynamic balance;
  String? createdAt;
  String? updatedAt;

  Wallets(
      {this.id,
      this.userId,
      this.type,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  Wallets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    totalCredit = json['total_credit'];
    totalDebit = json['total_debit'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['total_credit'] = this.totalCredit;
    data['total_debit'] = this.totalDebit;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
