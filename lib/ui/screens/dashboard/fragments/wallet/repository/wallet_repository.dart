import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/withdraw_model.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/transfer_to_wallet.dart';
import '../model/view_wallet_model.dart';
import '../model/view_wallet_transaction_model.dart';
import '../../../../../../utils/paths.dart';

class WalletRepository {
  /// [@TRANSFER] to wallet
  Future<TransferToWalletModel> transferToWallet(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url: Paths.viewTransferWallet,
          options: await getDioHeader());
      return TransferToWalletModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@View] wallet
  Future<ViewWalletModel> viewWallet() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.viewWallet, options: await getDioHeader());
      return ViewWalletModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@View] Transactions
  Future<ViewWalletTransactionModel> getWalletTransactions(int page) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.viewWalletTransactions}$page',
          options: await getDioHeader());
      return ViewWalletTransactionModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@View] Withdrawal
  Future<WithdrawModel> withdraw(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.withdraw}', map: map, options: await getDioHeader());
      return WithdrawModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
