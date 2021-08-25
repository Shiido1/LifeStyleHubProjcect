import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/repository/wallet_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

WalletRepository _walletRepository = WalletRepository();

class WalletViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  RefreshController get refreshController => _refreshController;

  int _currentPage = 1;
  int? _totalPages = 0;

  int get currentPage => _currentPage;

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

  /// transfer to wallet
  Future<void> transferToWallet(Map map) async {
    try {
      _showLoading();
      final _reponse = await _walletRepository.transferToWallet(map);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// check wallet
  Future<void> checkWallet() async {
    try {
      final _reponse = await _walletRepository.viewWallet();
      walletDao!.cacheWallet(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get wallet transactions
  Future<void> walletTransactions(int index) async {
    try {
      if (walletDao!.box!.isEmpty) _showLoading();
      final _response =
          await _walletRepository.getWalletTransactions(index);
      _totalPages = _response.walletTransactions!.total;
      walletDao!.saveTransactions(_response.walletTransactions!.data);
      _refreshController.refreshCompleted();
    } catch (e) {
      _hideLoading();
    }
    _hideLoading();
  }

  /// paginate responses
  void paginate() {
    if (_currentPage <= _totalPages!) {
      _currentPage++;
      walletTransactions(_currentPage);
    }
    notifyListeners();
  }
}
