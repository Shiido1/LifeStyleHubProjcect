import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/wallet_dao.dart';
import '../repository/wallet_repository.dart';
import '../../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

WalletRepository _walletRepository = WalletRepository();

class WalletViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
      _showLoading(notify: true);
      final _reponse = await _walletRepository.transferToWallet(map);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.green600);
      PageRouter.goBack(_context);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  void awaitTwoProcesses(int index) async {
    try {
      // _hideLoading();
      await Future.wait([_checkWallet(), _walletTransactions(index)]);
    } catch (e) {
      logger.e('Error waiting for multiple process -> $e');
    }
    _hideLoading();
  }

  /// check wallet
  Future<void> _checkWallet() async {
    try {
      final _reponse = await _walletRepository.viewWallet();
      walletDao!.cacheWallet(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get wallet transactions
  Future<void> _walletTransactions(int index) async {
    try {
      if (walletDao!.box!.isEmpty) _showLoading();
      final _response = await _walletRepository.getWalletTransactions(index);
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
      _walletTransactions(_currentPage);
    }
    notifyListeners();
  }

  /// perform withdrawal
  Future<void> withdrawal(Map map) async {
    try {
      _showLoading(notify: true);
      await _walletRepository.withdraw(map);
      showsnackBarInfo(_context,
          message: 'Pending admin\'s approval', bgColor: Pallets.green600);
    } catch (e) {
      showsnackBarInfo(_context,
          message: e.toString(), bgColor: Pallets.red600);
    }
    _hideLoading();
    PageRouter.goBack(_context);
  }

  /// perform transfer
  Future<void> transfer(Map map) async {
    try {
      _showLoading(notify: true);
      final _response = await _walletRepository.transfer(map);
      showsnackBarInfo(_context,
          message: _response.fromWalletTransaction?.status ?? 'Successful',
          bgColor: Pallets.green600);
      PageRouter.goBack(_context);
    } catch (e) {
      showsnackBarInfo(_context,
          message: e.toString(), bgColor: Pallets.red600);
    }
    _hideLoading();
  }

  Country? country;

  void setCountry(Country? country) {
    this.country = country;
    notifyListeners();
  }
}
