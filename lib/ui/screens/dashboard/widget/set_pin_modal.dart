import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../utils/pallets.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/text_views.dart';

enum PinEnum { withdraw, transfer, unknown }

class PinModel {
  final String? bankID;
  final String? amount;
  final String? purpose;
  final String? otp;
  final String? phoneNumber;

  PinModel(
      {this.bankID, this.amount, this.purpose, this.otp, this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'bank_id': bankID,
      'amount': amount,
      'purpose': purpose,
      'otp': otp,
      'receiver_phone_no': phoneNumber,
    };
  }
}

TextEditingController _otpController = TextEditingController();
final _formKey = GlobalKey<FormState>();

void showPinModal(BuildContext mContext, PinEnum pinEnum,
    {String? bankID, String? amount, String? purpose, String? phoneNumber}) {
  showModalBottomSheet(
      context: mContext,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
            padding: EdgeInsets.all(23),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Pallets.white),
            child: Consumer<WalletViewmodel>(
              builder: (context, wallet, child) {
                return LoadingOverlay(
                  isLoading: wallet.loading,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 23),
                          Center(
                            child: Container(
                              width: getDeviceWidth(context) / 5,
                              child: Divider(
                                thickness: 5,
                              ),
                            ),
                          ),
                          SizedBox(height: 23),
                          TextView(
                            text: 'Enter transaction OTP',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Pallets.grey900,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 23),
                          EditFormField(
                            floatingLabel: 'OTP',
                            label: 'OTP',
                            controller: _otpController,
                            keyboardType: TextInputType.number,
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
                            onPressed: () {
                              final _wallet = Provider.of<WalletViewmodel>(
                                  context,
                                  listen: false);
                              _wallet.init(context);
                              final _model = PinModel(
                                  bankID: bankID,
                                  amount: amount,
                                  purpose: purpose,
                                  otp: _otpController.text,
                                  phoneNumber: phoneNumber);

                              if (_formKey.currentState!.validate()) {
                                if (pinEnum == PinEnum.withdraw) {
                                  _wallet.withdrawal(_model.toMap());
                                }

                                if (pinEnum == PinEnum.transfer) {
                                  _wallet.transfer(_model.toMap());
                                }
                              }
                            },
                          ),
                          SizedBox(height: 23)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
      });
}
