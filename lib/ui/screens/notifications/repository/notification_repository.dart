import 'dart:async';

import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/notifications/model/notification_response.dart';

import '../../../../helper/configs/instances.dart';
import '../../../../utils/paths.dart';

class NotificationRepository {
  Future<NotificationResponse> notification() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.notifications, options: await getDioHeader());
      return NotificationResponse.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
