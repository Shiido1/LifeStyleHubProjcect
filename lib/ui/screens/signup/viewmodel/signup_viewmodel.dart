import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';
import 'package:lifestyle_hub/ui/screens/signup/repository/register_repository.dart';

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
    notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  /// perform Register request
  ///cache token temporery for other network request
  /// during the onBoarding
  Future<void> register({required Map map}) async {
    try {
      _showLoading();
      final _response = await _registerRepository.register(map: map);
      AppConstants.tempToken = _response.token;
      _hideLoading();
      PageRouter.gotoNamed(Routes.getStarted, _context);
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
