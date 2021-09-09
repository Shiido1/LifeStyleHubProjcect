import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/model/get_bank_account_model.dart';
import '../../../../../../database/hive_database.dart';

AccountDao? accountDao;

class AccountDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  AccountDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.account);
  }

  Future<void> saveBankAccounts(
      List<GetBankAccountModel>? getBankAccountModel) async {
    final map = Map<String, Map>.fromIterable(
      getBankAccountModel!,
      key: (g) => (g as GetBankAccountModel).id.toString(),
      value: (g) => (g as GetBankAccountModel).toJson(),
    );
    await _box!.putAll(map);
  }

  List<GetBankAccountModel> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => GetBankAccountModel.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
