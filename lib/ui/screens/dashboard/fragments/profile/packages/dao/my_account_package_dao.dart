import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../../database/hive_database.dart';
import '../model/my_accounts_model.dart';
import '../model/view_packages_model.dart';

AccountPackageDao? accountPackageDao;

class AccountPackageDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  AccountPackageDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.accountPackage);
  }

  Future<void> saveAccountPackages(
      List<MyAccountsModel>? viewPackagesList) async {
    final map = Map<String, Map>.fromIterable(
      viewPackagesList!,
      key: (g) => (g as MyAccountsModel).id.toString(),
      value: (g) => (g as MyAccountsModel).toJson(),
    );
    await _box!.putAll(map);
  }

  List<MyAccountsModel> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => MyAccountsModel.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
