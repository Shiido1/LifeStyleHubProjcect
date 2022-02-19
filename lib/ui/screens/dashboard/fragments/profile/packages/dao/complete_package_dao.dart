import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/view_packages_model.dart';

CompletePackageDao? completePackageDao;

class CompletePackageDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  CompletePackageDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.completePackage);
  }

  Future<void> saveActivePackages(
      List<CompletePackages>? viewPackagesList) async {
    final _map = Map<String, Map>.fromIterable(
      viewPackagesList!,
      key: (g) => (g as CompletePackages).name.toString(),
      value: (g) => (g as CompletePackages).toJson(),
    );
    await _box!.putAll(_map);
  }

  List<CompletePackages> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => CompletePackages.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openGraphsBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}