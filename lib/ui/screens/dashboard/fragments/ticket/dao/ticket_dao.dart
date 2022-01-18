import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../../database/hive_database.dart';
import '../../../../../../helper/configs/instances.dart';
import '../model/my_ticket_model.dart';
import '../model/my_ticket_status.dart';

TicketDao? ticketDao;

class TicketDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  TicketDao() {
    openGraphsBox().then(
      (value) => _box = value,
    );
  }

  Future<Box<Map>> openGraphsBox() {
    return HiveBoxes.openBox<Map>(HiveBoxes.ticket);
  }

  void cacheTicketStatus(Map map) async {
    await prefManager.saveValue(key: HiveBoxes.ticket, value: map);
  }

  Future<MyTicketStatusModel> getTicketStatus() async {
    final _data = await prefManager.getCachedData(key: HiveBoxes.ticket);
    // _box!.get(_data);
    return MyTicketStatusModel.fromJson(_data);
  }

  Future<void> saveTickets(List<Data>? data) async {
    await truncate();

    final map = Map<String, Map>.fromIterable(
      data!,
      key: (g) => (g as Data).id.toString(),
      value: (g) => (g as Data).toJson(),
    );
    logger.d(map);
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
