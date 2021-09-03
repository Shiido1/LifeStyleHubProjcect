import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/model/dashboard_model.dart';

DashboardDao? dashboardDao;

class DashboardDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  DashboardDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.dashboard);
  }

  Future<void> saveDashboard(Map map) async {
    await _box!.put(HiveBoxes.dashboard, map);
  }

  DashboardModel convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    var _data = raw[HiveBoxes.dashboard];
    if (_data != null)
      return DashboardModel.fromJson(
          json.decode(json.encode(raw[HiveBoxes.dashboard])));
    return DashboardModel();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
