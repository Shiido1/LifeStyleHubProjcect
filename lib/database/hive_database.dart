import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/dao/marketting_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/dao/ticket_dao.dart';

/// initialize local data storage
Future<void> initializeDatabase() async {
  await Hive.initFlutter();
  await HiveBoxes.openAllBox();
}

class HiveBoxes {
  static final marketing = 'marketing';
  static final ticket = 'ticket';

  static Future openAllBox() async {
    markettingDao = MarketingDao();
    ticketDao = TicketDao();
  }

  static Future clearAllBox() async {
    await markettingDao!.truncate();
    await ticketDao!.truncate();
  }

  static Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName);
        box = await Hive.openBox<T>(boxName);
      }
    }

    return box;
  }

  static Future<void> closeBox<T>(String boxName) async {
    Box box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
      box.close();
    }
  }

  static Future<void> clearData() async {
    await _clearBox<Map<String, dynamic>>(marketing);
  }

  static Future<void> _clearBox<T>(String name) async {
    try {
      final Box<T> _box = await openBox<T>(name);
      await _box.clear();
    } catch (_) {
      logger.e('clear $name error: ${_.toString()}');
    }
  }
}
