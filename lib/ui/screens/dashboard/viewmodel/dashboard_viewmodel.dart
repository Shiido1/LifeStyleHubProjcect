// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import '../../../../provider/_base_viewmodels.dart';
import '../dao/dashboardd_dao.dart';
import '../repository/dashboard_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

DashboardRepository _dashboardRepository = DashboardRepository();

class DashboardViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

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

  /// get Dashboards
  Future<void> getDashboards(bool isUser) async {
    try {
      final _response = await _dashboardRepository.dashboard(isUser);
      return dashboardDao!.saveDashboard(_response.toJson());
    } catch (e) {
      // showsnackBarInfo(this._context, message: e.toString());
      logger.e(e);
    }
    _hideLoading();
  }
}
