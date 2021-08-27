import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/dao/commission_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/repository/commission_repository.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/dao/point_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/model/point_history_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/repository/point_history_repository.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/dao/marketting_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/repository/marketting_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

PointHistoryRepository _pointHistoryRepository = PointHistoryRepository();

class PointHistoryViewmodel extends BaseViewModel {
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

  /// get history
  Future<void> getPointHistory() async {
    try {
      if (pointHistoryDao!.box!.isEmpty) _showLoading();
      final _response = await _pointHistoryRepository.pointHistory();
      pointHistoryDao!.saveContests(_response.pointHistory);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
