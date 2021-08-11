import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';
import 'package:lifestyle_hub/ui/screens/login/repository/login_repository.dart';
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
      final _response = await _informationRepository.registerBasicInformation(map: map);
      logger.d(_response.user!.toJson());
      _hideLoading();
      return true;
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
      return false;
    }
  }

  /// perform basic information upload request
  Future<void> registerWorkAndInInformation({required Map map}) async {
    try {
      _showLoading();
      final _response = await _informationRepository.registerWorkAndInInformation(map: map);
      logger.d(_response.bank!.toJson());
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
