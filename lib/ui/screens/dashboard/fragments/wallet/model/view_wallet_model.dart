// class ViewWalletModel {
//   Wallet? wallet;

//   ViewWalletModel({this.wallet});

//   ViewWalletModel.fromJson(Map<String, dynamic> json) {
//     if (json["wallet"] is Map)
//       this.wallet =
//           json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.wallet != null) data["wallet"] = this.wallet?.toJson();
//     return data;
//   }
// }

// class Wallet {
//   int? id;
//   int? userId;
//   int? totalIncome;
//   int? totalCredit;
//   int? totalDebit;
//   int? balance;
//   String? createdAt;
//   String? updatedAt;

//   Wallet(
//       {this.id,
//       this.userId,
//       this.totalIncome,
//       this.totalCredit,
//       this.totalDebit,
//       this.balance,
//       this.createdAt,
//       this.updatedAt});

//   Wallet.fromJson(Map<String, dynamic> json) {
//     if (json["id"] is int) this.id = json["id"];
//     if (json["user_id"] is int) this.userId = json["user_id"];
//     if (json["total_income"] is int) this.totalIncome = json["total_income"];
//     if (json["total_credit"] is int) this.totalCredit = json["total_credit"];
//     if (json["total_debit"] is int) this.totalDebit = json["total_debit"];
//     if (json["balance"] is int) this.balance = json["balance"];
//     if (json["created_at"] is String) this.createdAt = json["created_at"];
//     if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["id"] = this.id;
//     data["user_id"] = this.userId;
//     data["total_income"] = this.totalIncome;
//     data["total_credit"] = this.totalCredit;
//     data["total_debit"] = this.totalDebit;
//     data["balance"] = this.balance;
//     data["created_at"] = this.createdAt;
//     data["updated_at"] = this.updatedAt;
//     return data;
//   }
// }

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
  dynamic totalIncome;
  dynamic totalCredit;
  dynamic totalDebit;
  dynamic balance;
  String? createdAt;
  String? updatedAt;

  Wallets(
      {this.id,
      this.userId,
      this.type,
      this.totalIncome,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  Wallets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    totalIncome = json['total_income'];
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
    data['total_income'] = this.totalIncome;
    data['total_credit'] = this.totalCredit;
    data['total_debit'] = this.totalDebit;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
