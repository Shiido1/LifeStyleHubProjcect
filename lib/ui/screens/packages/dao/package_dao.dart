import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/ui/screens/packages/model/view_packages_model.dart';

PackageDao? packageDao;

class PackageDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  PackageDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.package);
  }

  Future<void> savePackages(List<ViewPackagesModel>? viewPackagesList) async {
    final map = Map<String, Map>.fromIterable(
      viewPackagesList!,
      key: (g) => (g as ViewPackagesModel).id.toString(),
      value: (g) => (g as ViewPackagesModel).toJson(),
    );
    await _box!.putAll(map);
  }

  List<ViewPackagesModel> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => ViewPackagesModel.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
