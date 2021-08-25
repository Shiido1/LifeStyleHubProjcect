import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/transfer_to_wallet.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_transaction_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class WalletRepository {
  /// [@TRANSFER] to wallet
  Future<TransferToWalletModel> transferToWallet(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map, url: Paths.viewTransferWallet, header: await getHeader());
      return TransferToWalletModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@View] wallet
  Future<ViewWalletModel> viewWallet() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.viewWallet, header: await getHeader());
      return ViewWalletModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@View] Transactions
  Future<ViewWalletTransactionModel> getWalletTransactions(int page) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.viewWalletTransactions}$page', header: await getHeader());
      return ViewWalletTransactionModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
