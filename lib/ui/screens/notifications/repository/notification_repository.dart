import 'dart:async';

import 'package:lifestyle_hub/helper/helper_handler.dart';

import '../../../../helper/configs/instances.dart';
import '../../../../utils/paths.dart';

class NotificationRepository {
  Future<dynamic> notification() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.notifications, options: await getDioHeader());
      logger.d(_response);
      return null;
    } catch (e) {
      throw e;
    }
  }
}
