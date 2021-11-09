import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import '../../../../../../utils/validators.dart';
import 'package:provider/provider.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../utils/pallets.dart';

TextEditingController _pinController = TextEditingController();
final _key = GlobalKey<FormState>();

void showOTPModal(BuildContext context, {String? amount, String? bankID}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23),
                Center(
                  child: Container(
                    width: getDeviceWidth(context) / 3,
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                EditFormField(
                  floatingLabel: 'Enter the OTP that was sen\'t to you',
                  label: 'Amount',
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: Validators.validateInt(),
                ),
                SizedBox(height: 40),
                ButtonWidget(
                  width: getDeviceWidth(context),
                  buttonText: 'Proceed',
                  color: Pallets.white,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.normal,
                  primary: Pallets.orange500,
                  borderColor: Pallets.orange500,
                  onPressed: () => _proceed(context),
                ),
                SizedBox(height: 23)
              ],
            ),
          ),
        );
      });
}

_proceed(BuildContext context) {
  if (_key.currentState!.validate()) {
    final _walletProvider =
        Provider.of<WalletViewmodel>(context, listen: false);
    _walletProvider.init(context);

    // showPinModal(context);
    // _walletProvider.withdtrrawal({
    //   'amount': _amountController.text,
    //   'bank_id': _accountModel!.id,
    //   // 'purpose': _purposeOfWithdrawalController.text,
    // });
    // PageRouter.goBack(context);
  }
}
