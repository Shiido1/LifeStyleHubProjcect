import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/tabs/model/temp_basic_information_model.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/information_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_dialog_menu_pop.dart';
import 'package:lifestyle_hub/ui/widgets/date_picker.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';

class BasicInformationWidget extends StatefulWidget {
  const BasicInformationWidget({Key? key}) : super(key: key);

  @override
  _BasicInformationWidgetState createState() => _BasicInformationWidgetState();
}

class _BasicInformationWidgetState extends State<BasicInformationWidget> {
  TextEditingController _fullNameController =
      TextEditingController(text: TempBasicInformationHolder.fullName ?? '');
  TextEditingController _phoneNumberController =
      TextEditingController(text: TempBasicInformationHolder.phoneNumber ?? '');
  TextEditingController _stateController =
      TextEditingController(text: TempBasicInformationHolder.state ?? '');
  TextEditingController _addressController =
      TextEditingController(text: TempBasicInformationHolder.address ?? '');
  TextEditingController _sexController =
      TextEditingController(text: TempBasicInformationHolder.sex ?? '');
  TextEditingController _dobController =
      TextEditingController(text: TempBasicInformationHolder.dateOfBirth ?? '');

  InformationViewModel? _informationViewModel;
  bool _dateSelected = false;
  bool _sexSelected = false;
  bool _stateSelected = false;

  @override
  void initState() {
    _informationViewModel =
        Provider.of<InformationViewModel>(context, listen: false);
    _informationViewModel!.init(context);
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
          text: 'Basic information',
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
              'This builds up your profile on Lifestyle Asset Hub, ease of login, and other operations',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Pallets.grey700,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Full name',
          label: 'Full name',
          controller: _fullNameController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Phone number',
          label: 'Phone number',
          controller: _phoneNumberController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'State/province',
          label: 'State',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
          controller: _stateController,
          readOnly: true,
          onTapped: () => showCustomDialog(context,
              title: 'Select state',
              items: AppConstants.getStates(), onTap: (value) {
            _stateSelected = true;
            _stateController.text = value;
            setState(() {});
            PageRouter.goBack(context);
          }),
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Address',
          label: 'Address',
          controller: _addressController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Sex',
          label: 'Sex',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: Pallets.disabledIconColor,
          controller: _sexController,
          readOnly: true,
          onTapped: () => showCustomDialog(context,
              title: 'Select sex', items: ['Male', 'Female'], onTap: (value) {
            _sexSelected = true;
            _sexController.text = value;
            setState(() {});
            PageRouter.goBack(context);
          }),
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Date of Birth',
          label: 'Date of Birth',
          suffixIcon: Icons.calendar_today_outlined,
          suffixIconColor: _dateSelected
              ? Pallets.activeIconColor
              : Pallets.disabledIconColor,
          readOnly: true,
          onTapped: () => pickDate(
              context: context,
              onChange: (String date) {
                _dateSelected = true;
                _dobController.text = date;
                setState(() {});
              }),
          controller: _dobController,
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
          height: 32,
        ),
      ],
    );
  }

  void _cacheTemporer(TabViewModel _tabViewModel) {
    TempBasicInformationHolder.fullName = _fullNameController.text;
    TempBasicInformationHolder.phoneNumber = _phoneNumberController.text;
    TempBasicInformationHolder.state = _stateController.text;
    TempBasicInformationHolder.address = _addressController.text;
    TempBasicInformationHolder.sex = _sexController.text;
    TempBasicInformationHolder.dateOfBirth = _dobController.text;
    _tabViewModel.switchIndex(1);
  }
}
