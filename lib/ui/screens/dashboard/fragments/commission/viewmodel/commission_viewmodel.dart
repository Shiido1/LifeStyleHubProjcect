import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/commission_dao.dart';
import '../repository/commission_repository.dart';
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

  List data = [];

  /// get commissions
  Future<void> getCommissions(
      {String? search,
      int page = 1,
      bool isRefreshing = false,
      bool isLoadMore = false}) async {
    try {
      if (commissionDao!.box!.isEmpty) _showLoading();
      if (data.length == 0) _showLoading();
      final _response =
          await _commissionRepository.getCommissions(search: search);
      commissionDao!.saveContests(_response.toJson());

      if (isLoadMore && _response.commissionHistory!.data!.isNotEmpty) {
        data.addAll(_response.commissionHistory!.data!);
      } else {
        data = _response.commissionHistory!.data!;
      }

      if (isRefreshing) _isRefreshing();

      if (isLoadMore) _isLoadMore(_response.commissionHistory!.data!);

      _refreshController.loadComplete();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
      _refreshController.loadFailed();
    }
    _hideLoading();
  }

  void _isRefreshing() {
    _page = 1;
    notifyListeners();
    _refreshController.refreshCompleted();
  }

  void _isLoadMore(List list) {
    isPagination = false;
    if (list.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  // ignore: unused_field
  int _page = 1;
  bool isPagination = false;

  void loadPagination(String path) {
    _page++;
    isPagination = true;
    notifyListeners();
    getCommissions(search: path, isLoadMore: true);
  }
}
