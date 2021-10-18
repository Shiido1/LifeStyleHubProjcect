import 'package:flutter/material.dart';
import 'viewmodel/account_viewmodel.dart';
import '../../dashboard/fragments/profile/dao/profile_dao.dart';
import '../../dashboard/fragments/profile/model/users_profile_model.dart';
import '../../../widgets/bottom_count_down.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/overlay.dart';
import '../../../../utils/pallets.dart';
import '../../../../utils/validators.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/helper_handler.dart';
import 'model/get_bank_account_model.dart';

class AddOrEditBankAccountScreen extends StatefulWidget {
  final GetBankAccountModel? bank;
  final bool isEdit;

  const AddOrEditBankAccountScreen({this.bank, this.isEdit = false, Key? key})
      : super(key: key);

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

  BankAccountViewmodel? _accountViewmodel;

  @override
  void initState() {
    _getCatchedInfos();
    _initializeControllers();
    _accountViewmodel =
        Provider.of<BankAccountViewmodel>(context, listen: false);
    _accountViewmodel!.init(context);
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
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
    return Consumer<BankAccountViewmodel>(builder: (_, _bankWatcher, __) {
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
                          autoValidate: false,
                          controller: _sortCodeController,
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Swift Code (if any)',
                          label: 'Enter swift code',
                          autoValidate: false,
                          controller: _swiftCodeController,
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
    final _response = await profileDao!.convert();

    Map _map = Map<String, dynamic>();
    _map['name'] = _response.name;
    _map['account_name'] = _accountNameController!.text;
    _map['account_no'] = _accountNoController!.text;
    _map['currency'] = 'Naira';

    if (_globalFormKey.currentState!.validate()) {
      !widget.isEdit
          ? _accountViewmodel!.addBankAccount(_map)
          : _accountViewmodel!.updateBankAccount(bank!.id.toString(), _map);
    } else
      setState(() => _autoValidate = true);
  }
}
