import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/repository/wallet_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

WalletRepository _walletRepository = WalletRepository();

class WalletViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

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
      _showLoading();
      final _reponse = await _walletRepository.viewWallet();
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get wallet transactions
  Future<void> walletTransactions() async {
    try {
      _showLoading();
      final _response = await _walletRepository.getWalletTransactions();
      _hideLoading();
      logger.d(_response.toJson());
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }
}
