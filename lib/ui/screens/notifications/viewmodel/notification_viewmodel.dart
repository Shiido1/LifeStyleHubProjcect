import 'package:flutter/material.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../provider/provider_architecture.dart';
import '../repository/notification_repository.dart';

NotificationRepository _notificationRepository = NotificationRepository();

class NotificationViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

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
      await _notificationRepository.notification();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
