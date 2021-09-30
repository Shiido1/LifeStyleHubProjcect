import 'package:flutter/material.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/commission_dao.dart';
import '../repository/commission_repository.dart';
import '../../marketting/dao/marketting_dao.dart';
import '../../marketting/model/get_resources_model.dart';
import '../../marketting/repository/marketting_repository.dart';
import '../../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CommissionRepository _commissionRepository = CommissionRepository();

class CommissionViewmodel extends BaseViewModel {
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

  /// get commissions
  Future<void> getCommissions({String? search, bool refresh = false}) async {
    try {
      if (commissionDao!.box!.isEmpty || refresh) _showLoading();
      final _response = await _commissionRepository.getCommissions(search: search);
      commissionDao!.saveContests(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
