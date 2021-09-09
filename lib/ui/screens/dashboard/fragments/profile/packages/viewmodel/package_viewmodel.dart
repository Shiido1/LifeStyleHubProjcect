import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/my_account_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/repository/packages_repository.dart';

PackageRepository _packageRepository = PackageRepository();

class PackageViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
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

  /// subscribe to package
  Future<void> subscribe(String id, Map map) async {
    try {
      _showLoading();
      final _reponse = await _packageRepository.payment(id, map);
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of packages
  Future<void> getPackages() async {
    try {
      if (packageDao!.box!.isEmpty) _showLoading();
      final _response = await _packageRepository.getListOfPackages();
      packageDao!.savePackages(_response.viewPackagesModel);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get single of package details
  Future<void> getPackagesDetails(String id) async {
    try {
      _showLoading();
      final _reponse = await _packageRepository.getPackageDetail(id);
      logger.d(_reponse.toJson());
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }

  /// get my account packages
  Future<void> getMyAccountPackages() async {
    try {
      if (accountPackageDao!.box!.isEmpty) _showLoading();
      final _reponse = await _packageRepository.getMyAccountPackages();
      accountPackageDao!.saveAccountPackages(_reponse.myAccountModelList);
      _hideLoading();
    } catch (e) {
      logger.e(e.toString());
      _hideLoading();
    }
  }
}
