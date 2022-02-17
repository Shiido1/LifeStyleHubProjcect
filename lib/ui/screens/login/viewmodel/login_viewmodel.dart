import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import '../../../../helper/routes/routes.dart';
import '../../../../provider/provider_architecture.dart';
import '../repository/login_repository.dart';

LoginRepository _loginRepository = LoginRepository();

class LoginViewModel extends BaseViewModel {
  late BuildContext _context;
  LoginModel? response;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context, {bool initialize = true}) {
    if (initialize) this._context = context;
  }

  /// show loading indicator
  void _showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// perform login request
  Future<void> login({required Map map}) async {
    try {
      _showLoading(notify: false);
      response = await _loginRepository.login(map: map);
      PageRouter.gotoNamed(Routes.dashboard, _context, clearStack: true);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
