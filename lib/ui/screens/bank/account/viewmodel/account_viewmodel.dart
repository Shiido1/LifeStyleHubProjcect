import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/dao/account_dao.dart';
import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../provider/_base_viewmodels.dart';
import '../repository/account_repository.dart';
import '../../../dashboard/fragments/marketting/model/get_resources_model.dart';
import '../../../dashboard/fragments/marketting/repository/marketting_repository.dart';
import '../../../../../utils/pallets.dart';

BankAccountRepository _accountRepository = BankAccountRepository();

class BankAccountViewmodel extends BaseViewModel {
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

  /// creates bank account
  Future<void> addBankAccount(Map map) async {
    try {
      _showLoading();
      await _accountRepository.addBankAccount(map);
      getMyBankAccounts();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// updates bank account
  Future<void> updateBankAccount(String id, Map map) async {
    try {
      _showLoading();
      await _accountRepository.updateBankAccount(map, id: id);
      showsnackBarInfo(_context,
          message: 'Update successful', bgColor: Pallets.green600);
      getMyBankAccounts();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of bank accounts
  Future<void> getMyBankAccounts() async {
    try {
      if (accountDao!.box!.isEmpty) _showLoading();
      final _response = await _accountRepository.getMyBankAccounts();
      accountDao!.saveBankAccounts(_response.getBankAccountModel);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get single of ban account details
  Future<void> getBankAccountDetails(String id) async {
    try {
      _showLoading();
      final _response = await _accountRepository.getBankAccountsDetails(id);
      logger.d(_response.toJson());
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }

  /// deletes a single bank account details
  Future<void> deleteBank(String id) async {
    try {
      _showLoading(notify: true);
      final _response = await _accountRepository.deleteBankAccountDetails(id);
      showsnackBarInfo(_context,
          message: _response.message, bgColor: Pallets.green600);
      getMyBankAccounts();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
