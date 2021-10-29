import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/payment/list_of_banks.dart'
    as lsh;
import 'package:lifestyle_hub/utils/pallets.dart';
import '../model/package_subcription_response.dart';
import '../model/view_packages_model.dart';
import 'package:dio/dio.dart';
import '../../../../../../../helper/helper_handler.dart';
import '../../../../../../../provider/_base_viewmodels.dart';
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
      final _response = await _packageRepository.payment(id, map);
      showsnackBarInfo(this._context,
          message: _response.message ?? '', bgColor: Pallets.green600);
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

  /// get list of bankz
  List<lsh.LshBankResponse>? list = [];

  Future<void> getLSHBankz() async {
    try {
      if (list!.length == 0) _showLoading(notify: true);
      final _response = await _packageRepository.getLSHBankz();
      list = _response.list ?? [];
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }


  /// make bank payment
  Future<void> makePayment(FormData formData) async {
    try {
       _showLoading(notify: true);
      final _response = await _packageRepository.makePayment(formData:formData);
      return _response;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
