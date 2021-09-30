import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../model/commission_model.dart';

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

  Future<void> saveContests(Map map) async {
    await _box!.put(HiveBoxes.commission, map);
  }

  CommissionModel convert(Box box) {
    try{
      Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
      return CommissionModel.fromJson(
          json.decode(json.encode(raw[HiveBoxes.commission])));
    }catch(_){
      return CommissionModel();
    }
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
