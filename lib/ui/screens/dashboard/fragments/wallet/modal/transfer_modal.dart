import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/set_pin_modal.dart';
import 'package:lifestyle_hub/ui/screens/otp/provider/pin_viewmodel.dart';
import '../../../../../widgets/overlay.dart';
import 'package:provider/provider.dart';
import '../../../../../../helper/helper_handler.dart';
import '../viewmodel/wallet_viewmodel.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/edit_form_widget.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';
import '../../../../../../utils/validators.dart';

TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _amountController = TextEditingController();

final _key = GlobalKey<FormState>();
// String? _countryCode = '+234';
WalletViewmodel? _walletProvider;

void showTransferModal(BuildContext context) {
  _walletProvider = Provider.of<WalletViewmodel>(context, listen: false);
  _walletProvider!.init(context);

  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer2<WalletViewmodel, OTPViewmodel>(
          builder: (context, provider, provider1, child) {
            return LoadingOverlay(
              isLoading: provider1.loading,
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
                          floatingLabel: 'Enter recipient phone number',
                          label: 'Phone No',
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          // prefixWidget: Padding(
                          //   padding: const EdgeInsets.only(left: 16.0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       TextView(
                          //         text: provider.country?.phoneCode == null
                          //             ? _countryCode!
                          //             : '+${provider.country?.phoneCode ?? ''}',
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 16,
                          //         color: Pallets.grey900,
                          //         textAlign: TextAlign.left,
                          //       ),
                          //       IconButton(
                          //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                          //         onPressed: () {
                          //           showCountryPicker(
                          //             context: context,
                          //             showPhoneCode: true,
                          //             onSelect: (Country country) {
                          //               _walletProvider!.init(context);
                          //               _walletProvider!.setCountry(country);
                          //             },
                          //             countryListTheme: CountryListThemeData(
                          //               borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(40.0),
                          //                 topRight: Radius.circular(40.0),
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 23),
                        EditFormField(
                          floatingLabel: 'Amount in local currency ',
                          label: 'Amount',
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

_proceed(BuildContext context) async {
  String? _phone = '${_phoneNumberController.text}';

  if (_key.currentState!.validate()) {
    final _otp = Provider.of<OTPViewmodel>(context, listen: false);
    _otp.init(context);
    // final _value =
    await _otp.generateOTP();
    // if (_value) {
    PageRouter.goBack(context);

    showPinModal(context, PinEnum.transfer,
        phoneNumber: _phone, amount: _amountController.text);
    // }
  }
}
