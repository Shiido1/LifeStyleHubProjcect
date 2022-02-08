import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/active_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/complete_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/inactive_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/payment/list_of_banks.dart'
    as lsh;
import 'package:lifestyle_hub/utils/pallets.dart';
import '../model/package_subcription_response.dart';
import '../model/view_packages_model.dart';
import 'package:dio/dio.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../../../../../../../provider/_base_viewmodels.dart';
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
      final _response = await _packageRepository.payment(id, map);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green600);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<ActivePackages>? completedPackages = [];
  List<ActivePackages>? inactivePackages = [];
  List<ActivePackages>? activePackages = [];

  /// get list of packages
  Future<void> getPackages() async {
    try {
      final _response = await _packageRepository.getListOfPackages();
      activePakageDao!.saveActivePackages(_response.activePackages ?? []);
      completePackageDao!.saveActivePackages(_response.completedPackages ?? []);
      inactivePackageDao!.saveActivePackages(_response.inactivePackages ?? []);
      activePackages = _response.activePackages;
      completedPackages = _response.completedPackages;
      inactivePackages = _response.inactivePackages;
      logger.d(activePackages!.length);
    } catch (e) {
      logger.e(e);
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

  /// get list of bankz
  List<lsh.LshBankResponse>? list = [];

  Future<void> getLSHBankz({bool isLoading = false}) async {
    try {
      if (list!.length == 0) _showLoading(notify: isLoading);
      final _response = await _packageRepository.getLSHBankz();
      list = _response.list ?? [];
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// fund account
  Future<void> fundWallet({required FormData formData}) async {
    try {
      _showLoading(notify: true);
      final _response = await _packageRepository.fundWallet(formData: formData);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green600);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// make bank payment
  Future<void> makePayment(int id) async {
    try {
      _showLoading(notify: true);
      final _response = await _packageRepository.makePayment(id: id);
      return _response;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
