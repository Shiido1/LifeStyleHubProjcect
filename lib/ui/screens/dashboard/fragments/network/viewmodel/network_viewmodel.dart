import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/view_account_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/view_account_network_response.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../network_repository.dart';

NetworkRepository _networkRepository = NetworkRepository();

class NetworkViewModel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  List<ViewAccountResponse>? _viewAccountResponseList = [];

  List<ViewAccountResponse>? get viewAccountResponseList =>
      _viewAccountResponseList;

  ViewAccountNetworkResponse? _accountNetworkResponse =
      ViewAccountNetworkResponse();

  ViewAccountNetworkResponse? get accountNetworkResponse =>
      _accountNetworkResponse;

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

  /// show loading indicator
  void _showAccountLoading() {
    _loading = true;
    notifyListeners();
  }

  /// hide loading indicator
  void _hideAccountLoading() {
    _loading = false;
    notifyListeners();
  }

  /// get list of network
  Future<void> getNetworkAccount() async {
    try {
      if (_viewAccountResponseList!.length == 0) _showLoading();
      final _response = await _networkRepository.getNetworkAccount();
      _viewAccountResponseList = _response.viewAccountResponseList;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get network details
  Future<void> getNetworkAccountDetails(int id) async {
    try {
      _showLoading();
      final _response = await _networkRepository.getNetworkAccountDetail(id);
      _accountNetworkResponse = _response;
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
