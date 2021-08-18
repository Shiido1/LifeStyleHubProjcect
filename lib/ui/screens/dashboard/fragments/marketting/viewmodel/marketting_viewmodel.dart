import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/repository/marketting_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

MarkettingRepository _markettingRepository = MarkettingRepository();

class MarkettingViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  GetResourcesModelList? _getResourcesModelList;

  GetResourcesModelList? get getResourceModelList => _getResourcesModelList;

  GetResourcesModel? _getResourceModel;
  GetResourcesModel? get getResourceModel => _getResourceModel;

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

  /// creates marketting
  Future<void> createMarketting(Map map) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.createMarketting(map);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of marketting
  Future<void> getMarketting() async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.getMarketting();
      // markettingDao!.saveAll([]);
      _getResourcesModelList = _reponse;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get single of marketting details
  Future<void> getMarkettingDetails(String id) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.getMarkettingDetails(id);
      _getResourceModel = _reponse;
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }

  /// updates a single marketting details
  Future<void> updateMarkettingDetails(String id, {dynamic formData}) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.updateMarkettingDetails(id,
          formData: formData);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// deletes a single marketting details
  Future<void> deleteMarketting(String id) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.deleteMarkettingDetails(id);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
