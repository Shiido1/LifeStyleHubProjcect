import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../model/dept_model.dart';

DeptDao? deptDao;

class DeptDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  DeptDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.department);
  }

  Future<void> saveDept(List<DepartmentModel>? data) async {
    final map = Map<String, Map>.fromIterable(
      data!,
      key: (g) => (g as DepartmentModel).id.toString(),
      value: (g) => (g as DepartmentModel).toJson(),
    );
    await _box!.putAll(map);
  }

  List<DepartmentModel> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => DepartmentModel.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
