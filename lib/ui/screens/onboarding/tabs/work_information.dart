import 'package:flutter/material.dart';
import '../../../../helper/helper_handler.dart';
import 'model/work_and_bank_information_model.dart';
import '../viewmodel/tab_viewmodel.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

class WorkInformationWidget extends StatefulWidget {
  const WorkInformationWidget({Key? key}) : super(key: key);

  @override
  _WorkInformationWidgetState createState() => _WorkInformationWidgetState();
}

class _WorkInformationWidgetState extends State<WorkInformationWidget> {
  TextEditingController _occupationController = TextEditingController(
      text: TempWorkAndBankInformationHolder.occupation ?? '');
  TextEditingController _industryController = TextEditingController(
      text: TempWorkAndBankInformationHolder.industry ?? '');
  TextEditingController _officialAddressController = TextEditingController(
      text: TempWorkAndBankInformationHolder.officialAddress ?? '');

  @override
  Widget build(BuildContext context) {
    final _tabViewModel = Provider.of<TabViewModel>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: 'Work / Banking',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        TextView(
          text:
              'This is a KYC to  understand where and how money comes into our network',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Pallets.grey700,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Occupation / work',
          label: 'Occupation / work',
          controller: _occupationController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Industry',
          label: 'Industry',
          controller: _industryController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Official address',
          label: 'Official address',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
          controller: _officialAddressController,
        ),
        SizedBox(
          height: 32,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Next',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => _cacheTemporer(_tabViewModel),
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
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  void _cacheTemporer(_tabViewModel) {
    TempWorkAndBankInformationHolder.occupation = _occupationController.text;
    TempWorkAndBankInformationHolder.industry = _industryController.text;
    TempWorkAndBankInformationHolder.officialAddress =
        _officialAddressController.text;
    _tabViewModel.switchIndex(3);
  }
}
