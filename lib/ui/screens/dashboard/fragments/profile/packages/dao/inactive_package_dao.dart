import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/view_packages_model.dart';

InactivePackageDao? inactivePackageDao;

class InactivePackageDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  InactivePackageDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.completePackage);
  }

  Future<void> saveActivePackages(
      List<ActivePackages>? viewPackagesList) async {
    final _map = Map<String, Map>.fromIterable(
      viewPackagesList!,
      key: (g) => (g as ActivePackages).name.toString(),
      value: (g) => (g as ActivePackages).toJson(),
    );
    await _box!.putAll(_map);
  }

  List<ActivePackages> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => ActivePackages.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  Future<ValueListenable<Box>?>? getListenable({List<String>? keys}) async {
    await openGraphsBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}