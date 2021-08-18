import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/repository/information_repository.dart';

InformationRepository _informationRepository = InformationRepository();

class InformationViewModel extends BaseViewModel {
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

  /// perform basic information upload request
  Future<bool> registerBasicInformation({required Map map}) async {
    try {
      _showLoading();
      await _informationRepository.registerBasicInformation(map: map);
      _hideLoading();
      return true;
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
      return false;
    }
  }

  /// perform basic information upload request
  Future<bool> registerWorkAndInInformation({required Map map}) async {
    try {
      _showLoading();
      await _informationRepository.registerWorkAndInInformation(map: map);
      _hideLoading();
      PageRouter.gotoNamed(Routes.welcome, _context);
      return true;
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
      return false;
    }
  }
}
