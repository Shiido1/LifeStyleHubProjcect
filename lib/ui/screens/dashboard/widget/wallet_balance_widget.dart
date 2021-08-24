import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/modal/transfer_modal.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/modal/withdraw_modal.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_model.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

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
                    TextView(
                      text: '${formatCurrency(_model.wallet?.balance ?? 0)}',
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      color: Pallets.grey700,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
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
                        SizedBox(width: 23),
                        InkWell(
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: getDeviceWidth(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 68),
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
                          TextView(
                            text:
                                '${formatCurrency(_model.wallet?.totalIncome ?? 0)}',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Pallets.grey700,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      width: getDeviceWidth(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 68),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Pallets.purple50),
                      child: Column(
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
                          TextView(
                            text:
                                '${formatCurrency(_model.wallet?.totalDebit ?? 0)}',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Pallets.grey700,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}
