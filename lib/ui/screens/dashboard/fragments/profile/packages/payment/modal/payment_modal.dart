import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import '../../../../../../../../helper/helper_handler.dart';
import '../../viewmodel/package_viewmodel.dart';
import '../../../../../../../widgets/buttons.dart';
import '../../../../../../../widgets/text_views.dart';
import '../../../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import '../lsh_banj_list.dart';

void showPayment(BuildContext context, int packageID) {
  final _payment = Provider.of<PackageViewmodel>(context, listen: false);
  _payment.init(context);
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
                        _payment
                            .subscribe(packageID, {'payment_method': 'wallet'});
                        PageRouter.goBack(context);
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
                      onPressed: () => null,
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: TextView(
                          text: 'insufficient fund?',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Pallets.grey400,
                          textAlign: TextAlign.center,
                          onTap: () {
                            PageRouter.goBack(context);
                            PageRouter.gotoWidget(LSHBankScreen(), context);
                          }),
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
