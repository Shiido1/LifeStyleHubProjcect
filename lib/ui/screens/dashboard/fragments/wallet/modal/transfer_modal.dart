import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/set_pin_modal.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _amountController = TextEditingController();

final _wallet = ChangeNotifierProvider((ref) => WalletViewmodel());
WalletViewmodel? _walletViewmodel;
final _key = GlobalKey<FormState>();
bool _validate = false;

void showTransferModal(BuildContext context) {
  _walletViewmodel = context.read(_wallet);
  _walletViewmodel!.init(context);
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Pallets.white),
          child: Form(
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
                  SizedBox(height: 23),
                  TextView(
                    text: 'Request withdrawal',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Pallets.grey900,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 32),
                  EditFormField(
                    floatingLabel: 'Enter recipient number',
                    label: '',
                    validator: Validators.validateEmail(),
                    controller: _emailController,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Pallets.orange500,
                      ),
                      TextView(
                        text: 'Save beneficiary',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Pallets.orange500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  EditFormField(
                    floatingLabel: 'Amount in local currency ',
                    label: ' ',
                    controller: _amountController,
                    validator: Validators.validateAmount(),
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
                    onPressed: () {
                      PageRouter.goBack(context);
                      // showPinModal(context);

                      _walletViewmodel!.transferToWallet({
                        'receiver_email': _emailController.text,
                        'amount': _amountController.text,
                      });
                    },
                  ),
                  SizedBox(height: 23)
                ],
              ),
            ),
          ),
        );
      });
}
