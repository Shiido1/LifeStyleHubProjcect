import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/repository/account_repository.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/model/get_resources_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/marketting/repository/marketting_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

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
      final _response = await _accountRepository.addBankAccount(map);
      logger.d(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// updates bank account
  Future<void> updateBankAccount(String id, FormData map) async {
    try {
      _showLoading();
      final _response = await _accountRepository.updateBankAccount(map, id: id);
      logger.d(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of bank accounts
  Future<void> getBankAccounts() async {
    try {
      _showLoading();
      final _response = await _accountRepository.getBankAccounts();
      logger.d(_response.getBankAccountModel!.length);
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
  Future<void> deleteMarketting(String id) async {
    try {
      _showLoading();
      final _response = await _accountRepository.deleteBankAccountDetails(id);
      showsnackBarInfo(_context,
          message: _response.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
