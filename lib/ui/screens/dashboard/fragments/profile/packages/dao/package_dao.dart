import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../../database/hive_database.dart';
import '../model/view_packages_model.dart';

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

  Future<void> savePackages(List<ViewPackagesModelList>? viewPackagesList) async {
    // final map = Map<String, Map>.fromIterable(
    //   viewPackagesList!,
    //   key: (g) => (g as ViewPackagesModelList).id.toString(),
    //   value: (g) => (g as ViewPackagesModel).toJson(),
    // );
    await _box!.putAll({});
  }

  List<ViewPackagesModelList> convert(Box box) {
    // Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    // return raw.values
    //     .map((e) => ViewPackagesModel.fromJson(json.decode(json.encode(e))))
    //     .toList();
    return [];
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
