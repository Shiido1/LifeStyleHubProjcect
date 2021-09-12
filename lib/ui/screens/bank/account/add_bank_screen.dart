import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/ui/screens/bank/account/viewmodel/account_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import '../../../../../helper/helper_handler.dart';
import 'model/get_bank_account_model.dart';

class AddOrEditBankAccountScreen extends StatefulWidget {
  final GetBankAccountModel? bank;

  const AddOrEditBankAccountScreen({this.bank, Key? key}) : super(key: key);

  @override
  _AddOrEditBankAccountScreenState createState() =>
      _AddOrEditBankAccountScreenState(bank);
}

class _AddOrEditBankAccountScreenState
    extends State<AddOrEditBankAccountScreen> {
  final GetBankAccountModel? bank;

  _AddOrEditBankAccountScreenState(this.bank);

  TextEditingController? _accountNameController;
  TextEditingController? _accountNoController;
  TextEditingController? _bankNameController;
  TextEditingController? _sortCodeController;
  TextEditingController? _swiftCodeController;

  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final _accountProvider =
      ChangeNotifierProvider((ref) => BankAccountViewmodel());

  BankAccountViewmodel? _accountViewmodel;

  @override
  void initState() {
    _initializeControllers();
    _accountViewmodel = context.read(_accountProvider);
    _accountViewmodel!.init(context);
    super.initState();
  }

  void _initializeControllers() {
    _accountNameController =
        TextEditingController(text: bank?.accountName ?? '');
    _accountNoController = TextEditingController(text: bank?.accountNo ?? '');
    _bankNameController = TextEditingController(text: bank?.name ?? '');
    _sortCodeController = TextEditingController(text: '');
    _swiftCodeController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      final _bankWatcher = watch(_accountProvider);
      return LoadingOverlay(
        isLoading: _bankWatcher.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: bank != null ? 'Edit bank details' : 'Add new bank',
              showLeadig: true,
              showImage: false,
              centerTitle: true,
              onTap: () => null),
          body: SafeArea(
            child: Form(
              key: _globalFormKey,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        EditFormField(
                          floatingLabel: 'Name on the account',
                          label: 'Enter name of account',
                          controller: _accountNameController,
                          autoValidate: _autoValidate,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Account numbers',
                          label: 'Enter account number',
                          controller: _accountNoController,
                          validator: Validators.validateInt(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Name of bank',
                          label: 'Enter bank name',
                          autoValidate: _autoValidate,
                          controller: _bankNameController,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Sort Code',
                          label: 'Enter sort code',
                          autoValidate: _autoValidate,
                          controller: _sortCodeController,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Swift Code (if any)',
                          label: 'Enter swift code',
                          autoValidate: _autoValidate,
                          controller: _swiftCodeController,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 32),
                        ButtonWidget(
                          width: getDeviceWidth(context),
                          buttonText: 'Save changes',
                          color: Pallets.white,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          fontStyle: FontStyle.normal,
                          primary: Pallets.orange600,
                          onPressed: () => _updateUsersInformation(),
                        ),
                        SizedBox(height: 90),
                      ],
                    ),
                  ),
                  ButtomCountDownWidget()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _updateUsersInformation() async {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _accountViewmodel!.addBankAccount({});
    } else
      setState(() => _autoValidate = true);
  }
}
