import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../model/point_history_model.dart';

PointHistoryDao? pointHistoryDao;

class PointHistoryDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  PointHistoryDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.point);
  }

  Future<void> savePoints(Map map) async {
    await _box!.put(HiveBoxes.point, map);
  }

  PointHistoryModel convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return PointHistoryModel.fromJson(json.decode(json.encode(raw[HiveBoxes.point])));
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openGraphsBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
