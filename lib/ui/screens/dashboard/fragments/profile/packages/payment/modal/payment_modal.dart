import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import '../../../../../../../../helper/helper_handler.dart';
import '../../viewmodel/package_viewmodel.dart';
import '../../../../../../../widgets/buttons.dart';
import '../../../../../../../widgets/text_views.dart';
import '../../../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import '../lsh_banj_list.dart';

void showPayment(
    BuildContext context, int packageID, PackageViewmodel _payment) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer<PackageViewmodel>(
          builder: (context, provider, child) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 23),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Pallets.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Select a payment option',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    Visibility(
                        visible: provider.loading,
                        child: LinearProgressIndicator()),
                    SizedBox(height: 24),
                    TextView(
                      text: 'Pay from wallet',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    TextView(
                      text:
                          'You will be charge 0 transaction cost using this payment method',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Pallets.grey500,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Pay now',
                      color: Pallets.white,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.orange600,
                      onPressed: () {
                        PageRouter.goBack(context);
                        walletBalanceModal(context, packageID, _payment);
                      },
                    ),
                    SizedBox(height: 32),
                    TextView(
                      text: 'Pay from Bank Transfer',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    TextView(
                      text:
                          'You will be charge 0 transaction cost using this payment method',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Pallets.grey500,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 16),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Pay now',
                      color: Pallets.white,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.orange600,
                      onPressed: () => {
                        PageRouter.goBack(context),
                        PageRouter.gotoWidget(LSHBankScreen(), context)
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        );
      });
}

void walletBalanceModal(
    BuildContext context, int packageID, PackageViewmodel _payment) {
  LoginModel? _wallet;
  logger.d(_wallet!.user!.wallets!.length);
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer<PackageViewmodel>(
          builder: (context, provider, child) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 23),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Pallets.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                        visible: provider.loading,
                        child: LinearProgressIndicator()),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Pallets.orange300),
                      child: TextView(
                        text: 'Wallet ID ()',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Pallets.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 33),
                    TextView(
                      text: 'Wallet balance',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Pallets.grey500,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    TextView(
                        text: '${formatCurrency(_getTotal(_wallet))}',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Pallets.grey700,
                        textAlign: TextAlign.center),
                    SizedBox(height: 23),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Make payment',
                      color: Pallets.white,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.orange600,
                      onPressed: () {
                        _payment
                            .subscribe(packageID, {'payment_method': 'wallet'});
                        PageRouter.goBack(context);
                      },
                    ),
                    SizedBox(height: 23),
                    TextView(
                      text: 'insufficient fund?',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Pallets.grey400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        );
      });
}

double? _getTotal(LoginModel wallets) {
  double totalScores = 0.0;
  wallets.user!.wallets!.forEach((item) {
    totalScores += item.balance!.toDouble();
  });
  return totalScores;
}
