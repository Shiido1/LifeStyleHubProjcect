import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/model/commission_model.dart';

CommissionDao? commissionDao;

class CommissionDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  CommissionDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.commission);
  }

  Future<void> saveContests(List<CommissionHistory>? commissionHistory) async {
    final map = Map<String, Map>.fromIterable(
      commissionHistory!,
      key: (g) => (g as CommissionHistory).email.toString(),
      value: (g) => (g as CommissionHistory).toJson(),
    );
    await _box!.putAll(map);
  }

  List<CommissionHistory> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => CommissionHistory.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
