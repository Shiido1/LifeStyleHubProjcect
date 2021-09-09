import 'package:flutter/material.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/contest_dao.dart';
import '../repository/contest_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

ContestRepository _contestRepository = ContestRepository();

class ContestViewModel extends BaseViewModel {
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

  /// creates contest
  Future<void> createContest(Map map) async {
    try {
      _showLoading();
      final _reponse = await _contestRepository.createContest(map);
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// updates contest
  Future<void> updatesContest(String id, Map map) async {
    try {
      _showLoading();
      final _reponse = await _contestRepository.createContest(map, id: id);
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of contests
  Future<void> getListContest() async {
    try {
      if (contestDao!.box!.isEmpty) _showLoading();
      final _response = await _contestRepository.getListContest();
      contestDao!.saveContests(_response.viewContestModelList);
      _refreshController.refreshCompleted();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
      _refreshController.refreshFailed();
    }
    _hideLoading();
  }

  /// get contests details
  Future<void> getContent(String id) async {
    try {
      _showLoading();
      final _response = await _contestRepository.getContest(id: id);
      logger.d(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get contest details
  Future<void> getContestsDetails(String id) async {
    try {
      _showLoading();
      final _response = await _contestRepository.getContest(id: id);
      logger.d(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get single of marketting details
  Future<void> getMarkettingDetails(String id) async {
    try {
      _showLoading();
      final _response = await _contestRepository.deleteContest(id);
      _hideLoading();
      logger.d(_response.toJson());
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
