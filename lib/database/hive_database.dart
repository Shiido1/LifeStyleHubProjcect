import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/active_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/complete_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/inactive_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/login/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../ui/screens/bank/account/dao/account_dao.dart';
import '../helper/configs/instances.dart';
import '../ui/screens/dashboard/dao/dashboardd_dao.dart';
import '../ui/screens/dashboard/fragments/commission/dao/commission_dao.dart';
import '../ui/screens/dashboard/fragments/contest/dao/contest_dao.dart';
import '../ui/screens/dashboard/fragments/integrated/dao/point_dao.dart';
import '../ui/screens/dashboard/fragments/marketting/dao/marketting_dao.dart';
import '../ui/screens/dashboard/fragments/messaging/dao/messaging_dao.dart';
import '../ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import '../ui/screens/dashboard/fragments/profile/packages/dao/my_account_package_dao.dart';
import '../ui/screens/dashboard/fragments/profile/packages/dao/package_dao.dart';
import '../ui/screens/dashboard/fragments/ticket/dao/dept_dao.dart';
import '../ui/screens/dashboard/fragments/ticket/dao/ticket_dao.dart';
import '../ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';

/// initialize local data storage
Future<void> initializeDatabase() async {
  await Hive.initFlutter();
  await HiveBoxes.openAllBox();
}

class HiveBoxes {
  static final marketing = 'marketing';
  static final ticket = 'ticket';
  static final message = 'message';
  static final open = 'open';
  static final wallet = 'wallet';
  static final contest = 'contest';
  static final commission = 'commission';
  static final point = 'point';
  static final department = 'department';
  static final dashboard = 'dashboard';
  static final package = 'package';
  static final accountPackage = 'accountPackage';
  static final profile = 'profile';
  static final account = 'account';
  static final activePackage = 'activePackage';
  static final completePackage = 'completePackage';
  static final inactivePackage = 'inactivePackage';

  static Future openAllBox() async {
    markettingDao = MarketingDao();
    ticketDao = TicketDao();
    messageDao = MessageDao();
    walletDao = WalletDao();
    contestDao = ContestDao();
    commissionDao = CommissionDao();
    pointHistoryDao = PointHistoryDao();
    deptDao = DeptDao();
    dashboardDao = DashboardDao();
    packageDao = PackageDao();
    accountPackageDao = AccountPackageDao();
    profileDao = ProfileDao();
    accountDao = AccountDao();
    activePakageDao = ActivePakageDao();
    completePackageDao = CompletePackageDao();
    inactivePackageDao = InactivePackageDao();
  }

  static Future clearAllBox() async {
    await markettingDao!.truncate();
    await ticketDao!.truncate();
    await messageDao!.truncate();
    await walletDao!.truncate();
    await contestDao!.truncate();
    await commissionDao!.truncate();
    await pointHistoryDao!.truncate();
    await deptDao!.truncate();
    await packageDao!.truncate();
    await accountPackageDao!.truncate();
    await profileDao!.truncate();
    await activePakageDao!.truncate();
    await completePackageDao!.truncate();
    await inactivePackageDao!.truncate();
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

  static logOut(BuildContext context) async {
    await prefManager.remove();
    await HiveBoxes.clearAllBox();
    PageRouter.gotoWidget(LoginScreen(), context,
        clearStack: true, animationType: PageTransitionType.fade);
  }
}
