import 'package:flutter/material.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import '../../../../helper/routes/routes.dart';
import '../../../../provider/provider_architecture.dart';
import '../repository/login_repository.dart';

LoginRepository _loginRepository = LoginRepository();

class LoginViewModel extends BaseViewModel {
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

  /// perform login request
  Future<void> login({required Map map}) async {
    try {
      _showLoading();
      await _loginRepository.login(map: map);
      PageRouter.gotoNamed(Routes.dashboard, _context, clearStack: true);
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
