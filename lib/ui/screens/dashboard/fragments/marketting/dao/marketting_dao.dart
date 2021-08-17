import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/database/hive_database.dart';

MarkettingDao? markettingDao;

class MarkettingDao {
  Box<Map>? _box;
  Box<Map>? get box => _box;

  MarkettingDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.marketting);
  }

  Future<void> saveAll(List contributions) async {
    // final map = Map<String, Map>.fromIterable(
    //   contributions,
    //   key: (g) => (g as DataContributed).id,
    //   value: (g) => (g as DataContributed).toJson(),
    // );
    // _box!.putAll(map);
  }

  // Future<List<DataContributed>> getAll() async {
  //   return _box.values.map((e) => DataContributed.fromJson(e)).toList();
  // }

  // List<DataContributed> convert(Box box) {
  //   Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
  //   return raw.values
  //       .map((e) => DataContributed.fromJson(json.decode(json.encode(e))))
  //       .toList();
  // }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
