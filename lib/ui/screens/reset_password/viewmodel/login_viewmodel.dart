import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';
import 'package:lifestyle_hub/ui/screens/reset_password/repository/reset_password_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

ResetPasswordRepository _repository = ResetPasswordRepository();

class ResetPasswordViewModel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context, {bool initialize = true}) {
    if (initialize) this._context = context;
  }

  /// show loading indicator
  void _showLoading() {
    _loading = true;
    notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// perform password reset request
  Future<void> resetPassword({required Map map}) async {
    try {
      _showLoading();
      final _response = await _repository.reset(map: map);
      PageRouter.gotoNamed(Routes.login, _context, clearStack: true);
      showsnackBarInfo(this._context,
          message: _response.status, bgColor: Pallets.green500);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
