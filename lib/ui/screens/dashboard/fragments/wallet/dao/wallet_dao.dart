import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../../../../../../helper/configs/instances.dart';
import '../model/view_wallet_model.dart';
import '../model/view_wallet_transaction_model.dart';

WalletDao? walletDao;

class WalletDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  WalletDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.wallet);
  }

  void cacheWallet(Map map) async {
    await prefManager.saveValue(key: HiveBoxes.wallet, value: map);
  }

  Future<ViewWalletModel> getWallet() async {
    final _data = await prefManager.getCachedData(key: HiveBoxes.wallet);
    return ViewWalletModel.fromJson(_data);
  }

  Future<void> saveTransactions(List<Data>? data) async {
    final map = Map<String, Map>.fromIterable(
      data!,
      key: (g) => (g as Data).id.toString(),
      value: (g) => (g as Data).toJson(),
    );
    await _box!.putAll(map);
  }

  List<Data> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Data.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
