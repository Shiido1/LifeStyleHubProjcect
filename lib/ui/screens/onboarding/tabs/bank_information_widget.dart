import 'package:flutter/material.dart';
import '../../../../helper/configs/instances.dart';
import '../../../../helper/helper_handler.dart';
import '../viewmodel/information_viewmodel.dart';
import '../viewmodel/tab_viewmodel.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import 'model/work_and_bank_information_model.dart';

class BankInformationWidget extends StatefulWidget {
  const BankInformationWidget({Key? key}) : super(key: key);

  @override
  _BankInformationWidgetState createState() => _BankInformationWidgetState();
}

class _BankInformationWidgetState extends State<BankInformationWidget> {
  TextEditingController _nameOfAcctController = TextEditingController(
      text: TempWorkAndBankInformationHolder.nameOfAccount ?? '');
  TextEditingController _acctNumberController = TextEditingController(
      text: TempWorkAndBankInformationHolder.accountNumber ?? '');
  TextEditingController _bankNameController = TextEditingController(
      text: TempWorkAndBankInformationHolder.nameOfBank ?? '');
  TextEditingController _sortController = TextEditingController(
      text: TempWorkAndBankInformationHolder.sortCode ?? '');
  TextEditingController _swiftController = TextEditingController(
      text: TempWorkAndBankInformationHolder.swiftCode ?? '');

  InformationViewModel? _informationModel;

  @override
  void initState() {
    _informationModel =
        Provider.of<InformationViewModel>(context, listen: false);
    _informationModel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Banking Information',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 32,
        ),
        EditFormField(
          floatingLabel: 'Name of the account',
          label: 'Name of the account',
          controller: _nameOfAcctController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Account number',
          label: 'Account number',
          controller: _acctNumberController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Name of bank',
          label: 'Name of bank',
          controller: _bankNameController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Sort code',
          label: 'Sort code',
          controller: _sortController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Swift code (If any)',
          label: 'Swift code (If any)',
          controller: _swiftController,
        ),
        SizedBox(
          height: 40,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Previous',
          color: Pallets.grey800,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          borderColor: Color(0xff3F3F46),
          primary: Pallets.white,
          onPressed: () => _cacheTemporer(_tabViewModel),
        ),
        SizedBox(
          height: 24,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Save & start 14 days free trial',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => _makeRequest(_tabViewModel),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
          child: TextView(
            text: 'Skip & start 14 days free trial',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Pallets.grey500,
            textAlign: TextAlign.center,
            onTap: () => _makeRequest(_tabViewModel),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  void _cacheTemporer(_tabViewModel) {
    TempWorkAndBankInformationHolder.nameOfAccount = _nameOfAcctController.text;
    TempWorkAndBankInformationHolder.accountNumber = _acctNumberController.text;
    TempWorkAndBankInformationHolder.nameOfBank = _bankNameController.text;
    TempWorkAndBankInformationHolder.sortCode = _sortController.text;
    TempWorkAndBankInformationHolder.swiftCode = _swiftController.text;
    _tabViewModel.switchIndex(2);
  }

  void _makeRequest(TabViewModel _tabViewModel) async {
    _informationModel!.registerWorkAndInInformation(
        map: TempWorkAndBankInformationHolder.sendData(
            occupation: TempWorkAndBankInformationHolder.occupation!,
            industry: TempWorkAndBankInformationHolder.industry!,
            address: TempWorkAndBankInformationHolder.officialAddress!,
            bankName: _bankNameController.text,
            accountName: _nameOfAcctController.text,
            accountNumber: _acctNumberController.text,
            sortCode: _sortController.text,
            swiftCode: _swiftController.text));
  }
}
