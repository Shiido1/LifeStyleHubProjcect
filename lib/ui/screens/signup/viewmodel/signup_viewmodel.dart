import 'package:flutter/material.dart';
import '../../../../core/data/session_manager.dart';

import '../../../../helper/configs/constants.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import '../../../../helper/routes/routes.dart';
import '../../../../provider/provider_architecture.dart';
import '../repository/register_repository.dart';

RegisterRepository _registerRepository = RegisterRepository();

class RegisterViewModel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context) {
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
    // notifyListeners();
  }

  /// perform Register request & cache token temporery for other network request
  /// during the onBoarding and also cache email and password to log user in when all
  /// other onBoarding are successful
  Future<void> register({required Map map}) async {
    try {
      _showLoading();
      final _response = await _registerRepository.register(map: map);

      /// cache users token
      SessionManager.instance.authToken = _response.token!;
      AppConstants.tempEmail = map['email'];
      AppConstants.tempPassword = map['password'];
      _hideLoading();
      PageRouter.gotoNamed(Routes.getStarted, _context);
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
