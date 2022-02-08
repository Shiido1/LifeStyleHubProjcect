import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/payment/lsh_banj_list.dart';
import '../../../../helper/helper_handler.dart';
import '../fragments/wallet/dao/wallet_dao.dart';
import '../fragments/wallet/modal/transfer_modal.dart';
import '../fragments/wallet/modal/withdraw_modal.dart';
import '../fragments/wallet/model/view_wallet_model.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: walletDao!.getWallet(),
        builder: (context, AsyncSnapshot<ViewWalletModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Container();
          }
          ViewWalletModel _model = snapshot.data!;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: getDeviceWidth(context),
                padding: EdgeInsets.all(23),
                decoration: BoxDecoration(
                    color: Pallets.orange50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView(
                      text: 'Available balance',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Pallets.orange500,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    ..._model.wallets!
                        .map(
                          (e) => e.type == "fund"
                              ? TextView(
                                  text: '${formatCurrency(e.balance ?? 0)}',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 48,
                                  color: Pallets.grey700,
                                  textAlign: TextAlign.center,
                                )
                              : SizedBox(),
                        )
                        .toList(),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () =>
                                PageRouter.gotoWidget(LSHBankScreen(), context),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Pallets.orange200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.call_received_outlined,
                                      color: Pallets.grey600),
                                ),
                                SizedBox(height: 8),
                                TextView(
                                  text: 'Fund wallet',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => showWithdrawModal(context),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Pallets.orange200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.call_made_outlined,
                                      color: Pallets.grey600),
                                ),
                                SizedBox(height: 8),
                                TextView(
                                  text: 'Withdraw',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => showTransferModal(context),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Pallets.orange200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.swap_horiz_outlined,
                                      color: Pallets.grey600),
                                ),
                                SizedBox(height: 8),
                                TextView(
                                  text: 'Transfer',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Pallets.grey600,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: getDeviceWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 34),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Pallets.blue50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView(
                      text: 'Total incomes',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Pallets.grey500,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ..._model.wallets!
                        .map((e) => e.type == "fund"
                            ? TextView(
                                text: '${formatCurrency(e.totalIncome ?? 0)}',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Pallets.grey700,
                                textAlign: TextAlign.center,
                              )
                            : SizedBox())
                        .toList(),
                  ],
                ),
              ),
              SizedBox(height: 23),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: 'Withdraws',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey500,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ..._model.wallets!
                      .map((e) => e.type == "fund"
                          ? TextView(
                              text: '${formatCurrency(e.totalDebit)}',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Pallets.grey700,
                              textAlign: TextAlign.center,
                            )
                          : SizedBox())
                      .toList(),
                ],
              )
            ],
          );
        });
  }
}
