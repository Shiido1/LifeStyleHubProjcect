import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../../../../../../helper/configs/instances.dart';
import '../model/get_last_messages_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart'
    as open;

MessageDao? messageDao;

class MessageDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  MessageDao() {
    openGraphsBox().then((value) => _box = value);
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.message);
  }

  Future<void> saveChat(String id, Map map) async {
    await prefManager.saveValue(key: id, value: map);
  }

  Future<open.OpenMessageModel> getChat(String id) async {
    final _data = await prefManager.getStringValues(key: id);
    return open.OpenMessageModel.fromJson(json.decode(_data!)!);
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
