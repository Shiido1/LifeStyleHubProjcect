import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/repository/marketting_repository.dart';

MarkettingRepository _markettingRepository = MarkettingRepository();

class MarkettingViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  List<GetResourcesModel>? _getResourceModel;

  List<GetResourcesModel>? get getResourceModel => _getResourceModel;

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

  /// get list of marketting
  Future<void> getMarketting() async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.getMarketting();
      // markettingDao!.saveAll([]);
      logger.d(_reponse.getResourceModel!.length);
      _getResourceModel = _reponse.getResourceModel;
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
