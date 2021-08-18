class TransferToWalletModel {
  FromWallet? fromWallet;
  FromWalletTransaction? fromWalletTransaction;
  ToWallet? toWallet;
  ToWalletTransaction? toWalletTransaction;
  String? message;

  TransferToWalletModel(
      {this.fromWallet,
      this.fromWalletTransaction,
      this.toWallet,
      this.toWalletTransaction,
      this.message});

  TransferToWalletModel.fromJson(Map<String, dynamic> json) {
    if (json["from_wallet"] is Map)
      this.fromWallet = json["from_wallet"] == null
          ? null
          : FromWallet.fromJson(json["from_wallet"]);
    if (json["from_wallet_transaction"] is Map)
      this.fromWalletTransaction = json["from_wallet_transaction"] == null
          ? null
          : FromWalletTransaction.fromJson(json["from_wallet_transaction"]);
    if (json["to_wallet"] is Map)
      this.toWallet = json["to_wallet"] == null
          ? null
          : ToWallet.fromJson(json["to_wallet"]);
    if (json["to_wallet_transaction"] is Map)
      this.toWalletTransaction = json["to_wallet_transaction"] == null
          ? null
          : ToWalletTransaction.fromJson(json["to_wallet_transaction"]);
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fromWallet != null)
      data["from_wallet"] = this.fromWallet?.toJson();
    if (this.fromWalletTransaction != null)
      data["from_wallet_transaction"] = this.fromWalletTransaction?.toJson();
    if (this.toWallet != null) data["to_wallet"] = this.toWallet?.toJson();
    if (this.toWalletTransaction != null)
      data["to_wallet_transaction"] = this.toWalletTransaction?.toJson();
    data["message"] = this.message;
    return data;
  }
}

class ToWalletTransaction {
  int? walletId;
  String? referenceId;
  String? type;
  String? category;
  String? status;
  String? meta;
  int? amount;
  int? id;

  ToWalletTransaction(
      {this.walletId,
      this.referenceId,
      this.type,
      this.category,
      this.status,
      this.meta,
      this.amount,
      this.id});

  ToWalletTransaction.fromJson(Map<String, dynamic> json) {
    if (json["wallet_id"] is int) this.walletId = json["wallet_id"];
    if (json["reference_id"] is String) this.referenceId = json["reference_id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["category"] is String) this.category = json["category"];
    if (json["status"] is String) this.status = json["status"];
    if (json["meta"] is String) this.meta = json["meta"];
    if (json["amount"] is int) this.amount = json["amount"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["wallet_id"] = this.walletId;
    data["reference_id"] = this.referenceId;
    data["type"] = this.type;
    data["category"] = this.category;
    data["status"] = this.status;
    data["meta"] = this.meta;
    data["amount"] = this.amount;
    data["id"] = this.id;
    return data;
  }
}

class ToWallet {
  int? id;
  int? userId;
  int? totalIncome;
  int? totalCredit;
  int? totalDebit;
  int? balance;
  String? createdAt;
  String? updatedAt;

  ToWallet(
      {this.id,
      this.userId,
      this.totalIncome,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  ToWallet.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["total_income"] is int) this.totalIncome = json["total_income"];
    if (json["total_credit"] is int) this.totalCredit = json["total_credit"];
    if (json["total_debit"] is int) this.totalDebit = json["total_debit"];
    if (json["balance"] is int) this.balance = json["balance"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["total_income"] = this.totalIncome;
    data["total_credit"] = this.totalCredit;
    data["total_debit"] = this.totalDebit;
    data["balance"] = this.balance;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class FromWalletTransaction {
  int? walletId;
  String? referenceId;
  String? type;
  String? category;
  String? status;
  String? meta;
  int? amount;
  int? id;

  FromWalletTransaction(
      {this.walletId,
      this.referenceId,
      this.type,
      this.category,
      this.status,
      this.meta,
      this.amount,
      this.id});

  FromWalletTransaction.fromJson(Map<String, dynamic> json) {
    if (json["wallet_id"] is int) this.walletId = json["wallet_id"];
    if (json["reference_id"] is String) this.referenceId = json["reference_id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["category"] is String) this.category = json["category"];
    if (json["status"] is String) this.status = json["status"];
    if (json["meta"] is String) this.meta = json["meta"];
    if (json["amount"] is int) this.amount = json["amount"];
    if (json["id"] is int) this.id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["wallet_id"] = this.walletId;
    data["reference_id"] = this.referenceId;
    data["type"] = this.type;
    data["category"] = this.category;
    data["status"] = this.status;
    data["meta"] = this.meta;
    data["amount"] = this.amount;
    data["id"] = this.id;
    return data;
  }
}

class FromWallet {
  int? id;
  int? userId;
  int? totalIncome;
  int? totalCredit;
  int? totalDebit;
  int? balance;
  String? createdAt;
  String? updatedAt;

  FromWallet(
      {this.id,
      this.userId,
      this.totalIncome,
      this.totalCredit,
      this.totalDebit,
      this.balance,
      this.createdAt,
      this.updatedAt});

  FromWallet.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["total_income"] is int) this.totalIncome = json["total_income"];
    if (json["total_credit"] is int) this.totalCredit = json["total_credit"];
    if (json["total_debit"] is int) this.totalDebit = json["total_debit"];
    if (json["balance"] is int) this.balance = json["balance"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["total_income"] = this.totalIncome;
    data["total_credit"] = this.totalCredit;
    data["total_debit"] = this.totalDebit;
    data["balance"] = this.balance;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
