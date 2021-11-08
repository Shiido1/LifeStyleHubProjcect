import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/notifications/model/notification_response.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../provider/provider_architecture.dart';
import '../repository/notification_repository.dart';

NotificationRepository _notificationRepository = NotificationRepository();

class NotificationViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  int unreadNotifications = 0;
  List<Data> notificationList = [];

  /// initialize auth viewmodel
  void init(BuildContext context, {bool initialize = true}) {
    this._context = context;
  }

  /// show loading indicator
  void _showLoading() {
    _loading = true;
    // notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// fetch my notifications
  Future<void> notification() async {
    try {
      _showLoading();
      final _response = await _notificationRepository.notification();
      unreadNotifications = _response.unreadNotifications ?? 0;
      notificationList = _response.notifications?.data ?? [];
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// clear notifications list
  void clearNotificationList() {
    notificationList.clear();
    notifyListeners();
  }
}
