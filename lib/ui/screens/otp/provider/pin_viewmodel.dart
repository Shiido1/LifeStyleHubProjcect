import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/otp/service/pin_service.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';

import '../../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

PinRepository _pinRepository = PinRepository();

class OTPViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  int _currentPage = 1;
  // ignore: unused_field
  int? _totalPages = 0;

  int get currentPage => _currentPage;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// generate OTP
  Future<bool> generateOTP() async {
    try {
      showLoading(notify: true);
      await _pinRepository.generateOTP();
      return true;
    } catch (e) {
      showsnackBarInfo(_context,
          message: e.toString(), bgColor: Pallets.red600);
      logger.d(e);
    }
    hideLoading();
    return false;
  }
}
