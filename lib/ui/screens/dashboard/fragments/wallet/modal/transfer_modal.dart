import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:provider/provider.dart';
import '../../../../../../helper/helper_handler.dart';
import '../viewmodel/wallet_viewmodel.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/edit_form_widget.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';
import '../../../../../../utils/validators.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _amountController = TextEditingController();

WalletViewmodel? _walletViewmodel;
final _key = GlobalKey<FormState>();

void showTransferModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer<WalletViewmodel>(
          builder: (context, provider, child) {
            return LoadingOverlay(
              isLoading: provider.loading,
              child: Container(
                padding: EdgeInsets.all(23),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Pallets.white),
                child: Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          text: 'Request transfer',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Pallets.grey900,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 23),
                        EditFormField(
                          floatingLabel: 'Enter recipient email',
                          label: '',
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.validateEmail(),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 23),
                        EditFormField(
                          floatingLabel: 'Amount in local currency ',
                          label: '',
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.validateAmount(),
                        ),
                        SizedBox(height: 23),
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
                ),
              ),
            );
          },
        );
      });
}

_proceed(BuildContext context) {
  if (_key.currentState!.validate()) {
    final _walletProvider =
        Provider.of<WalletViewmodel>(context, listen: false);
    _walletProvider.init(context);

    // showPinModal(context);
    _walletViewmodel!.transferToWallet({
      'receiver_email': _emailController.text,
      'amount': _amountController.text,
    });
  }
}
