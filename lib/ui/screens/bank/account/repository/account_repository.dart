import 'package:dio/dio.dart';

import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/helper_handler.dart';
import '../model/add_bank_account_model.dart';
import '../model/delete_bank_account_model.dart';
import '../model/get_bank_account_model.dart';
import '../../../../../utils/paths.dart';

class BankAccountRepository {
  /// [@CREATE] bank account
  Future<AddBankAccountModel> addBankAccount(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map, url: Paths.addBankAccount, options: await getDioHeader());
      return AddBankAccountModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@UPDATE] bank account
  Future<AddBankAccountModel> updateBankAccount(FormData map,
      {String id = ''}) async {
    try {
      final _response = await apiBaseHelper.put(
          map: map,
          url: '${Paths.addBankAccount}${id.isNotEmpty ? '/$id' : ''}',
          options: await getDioHeader());
      return AddBankAccountModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] accounts
  Future<GetBankAccountModelList> getBankAccounts() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.getBankAccount, options: await getDioHeader());
      return GetBankAccountModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get] bank details
  Future<GetBankAccountModel> getBankAccountsDetails(String id) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getBankAccount}/$id', options: await getDioHeader());
      return GetBankAccountModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Delete] Bank account details
  Future<DeleteBankAccountModel> deleteBankAccountDetails(String id) async {
    try {
      final _response = await apiBaseHelper.delete(
          url: '${Paths.getBankAccount}/$id', options: await getDioHeader());
      return DeleteBankAccountModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
