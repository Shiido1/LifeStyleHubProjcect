import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/package_subcription_response.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/view_packages_model.dart';
import '../../../../../../../helper/configs/instances.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../../../../../../../provider/_base_viewmodels.dart';
import '../dao/my_account_package_dao.dart';
import '../dao/package_dao.dart';
import '../repository/packages_repository.dart';

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
  Future<void> subscribe(int id, Map map) async {
    try {
      _showLoading(notify: true);
      final _reponse = await _packageRepository.payment(id, map);
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<ActivePackages>? activePackages = [];
  List<ActivePackages>? completedPackages = [];
  List<ActivePackages>? inactivePackages = [];

  /// get list of packages
  Future<void> getPackages() async {
    try {
      if (packageDao!.box!.isEmpty) _showLoading();
      final _response = await _packageRepository.getListOfPackages();
      activePackages = _response.activePackages;
      completedPackages = _response.completedPackages;
      inactivePackages = _response.inactivePackages;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<PackageSubcriptionResponse>? packageListResponse = [];

  /// get list of packages for subscribing
  Future<void> getAvailablePackages() async {
    try {
      if (packageListResponse!.length == 0) _showLoading();
      final _response = await _packageRepository.getAvailablePackages();
      packageListResponse = _response.packageList;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
