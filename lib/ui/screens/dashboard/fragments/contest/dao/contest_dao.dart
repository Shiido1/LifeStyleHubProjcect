import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../model/view_contest_model.dart';

ContestDao? contestDao;

class ContestDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  ContestDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.contest);
  }

  Future<void> saveContests(
      List<ViewContestModel>? viewContestModelList) async {
    final map = Map<String, Map>.fromIterable(
      viewContestModelList!,
      key: (g) => (g as ViewContestModel).id.toString(),
      value: (g) => (g as ViewContestModel).toJson(),
    );
    await _box!.putAll(map);
  }

  List<ViewContestModel> convert(Box box) {
    Map<String, dynamic> raw = new Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => ViewContestModel.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  ValueListenable<Box>? getListenable({List<String>? keys}) {
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future truncate() async => await _box?.clear();
}
