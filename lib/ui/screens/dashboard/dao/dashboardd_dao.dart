import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../database/hive_database.dart';
import '../../../../helper/configs/instances.dart';
import '../model/dashboard_model.dart';

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
    await prefManager.saveValue(key: HiveBoxes.dashboard, value: map);
  }

  Future<DashboardModel> getUsersInformation() async{
    final _response = await prefManager.getCachedData(key: HiveBoxes.dashboard);
    return DashboardModel.fromJson(_response);
  }

  DashboardModel convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return DashboardModel.fromJson(raw[HiveBoxes.dashboard]);
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
