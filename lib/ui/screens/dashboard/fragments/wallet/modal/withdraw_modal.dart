import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/dao/account_dao.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/model/get_bank_account_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/modal/bank_pop_modal.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../../../widget/set_pin_modal.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/edit_form_widget.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

TextEditingController _accountDetailsController = TextEditingController();
TextEditingController _amountController = TextEditingController();
TextEditingController _purposeOfWithdrawalController = TextEditingController();
GetBankAccountModel? _accountModel;
final _key = GlobalKey<FormState>();

void showWithdrawModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer<WalletViewmodel>(builder: (context, provider, child) {
          return LoadingOverlay(
            isLoading: provider.loading,
            child: ValueListenableBuilder(
                valueListenable: accountDao!.getListenable()!,
                builder: (_, Box<dynamic> box, __) {
                  List<GetBankAccountModel> _bankList =
                      accountDao!.convert(box).toList();
                  return Container(
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
                            SizedBox(height: 5),
                            TextView(
                              text: 'Please enter your destination account',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Pallets.grey600,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 32),
                            EditFormField(
                              floatingLabel: 'Beneficiary account information',
                              label: '',
                              onTapped: () => showBankPopUpList(context,
                                  title: 'Select bank',
                                  items: _bankList, onTap: (value) {
                                _accountDetailsController.text = value.name!;
                                _accountModel = value;
                                PageRouter.goBack(context);
                              }),
                              readOnly: true,
                              controller: _accountDetailsController,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: Validators.validateString(),
                            ),
                            SizedBox(height: 32),
                            EditFormField(
                              floatingLabel: 'Purpose of withdrawal',
                              label: '',
                              controller: _purposeOfWithdrawalController,
                              keyboardType: TextInputType.text,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: Validators.validateString(),
                            ),
                            SizedBox(height: 32),
                            EditFormField(
                              floatingLabel: 'Amount in local currency ',
                              label: ' ',
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              onPressed: () => _proceed(context),
                            ),
                            SizedBox(height: 23)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
      });
}

_proceed(BuildContext context) {
  if (_key.currentState!.validate()) {
    final _walletProvider =
        Provider.of<WalletViewmodel>(context, listen: false);
    _walletProvider.init(context);

    // showPinModal(context);
    _walletProvider.withdrawal({
      'amount': _amountController.text,
      'bank_id': _accountModel!.id,
      'purpose': _purposeOfWithdrawalController.text,
    });
  }
}
