import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../model/get_resources_model.dart';

MarketingDao? markettingDao;

class MarketingDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  MarketingDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.marketing);
  }

  Future<void> saveContents(List<Data>? data) async {
    final map = Map<String, Map>.fromIterable(
      data!,
      key: (g) => (g as Data).id.toString(),
      value: (g) => (g as Data).toJson(),
    );
    await _box!.putAll(map);
  }

  List<Data> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Data.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
