import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/dashboard.dart';
import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import 'model/temp_basic_information_model.dart';
import '../viewmodel/information_viewmodel.dart';
import '../viewmodel/tab_viewmodel.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/custom_dialog_menu_pop.dart';
import '../../../widgets/date_picker.dart';
import '../../../widgets/edit_form_widget.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

class BasicInformationWidget extends StatefulWidget {
  const BasicInformationWidget({Key? key}) : super(key: key);

  @override
  _BasicInformationWidgetState createState() => _BasicInformationWidgetState();
}

class _BasicInformationWidgetState extends State<BasicInformationWidget> {
  TextEditingController _fullNameController =
      TextEditingController(text: TempBasicInformationHolder.fullName ?? '');
  TextEditingController _userNameController =
      TextEditingController(text: TempBasicInformationHolder.userName ?? '');
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
  // ignore: unused_field
  bool _sexSelected = false;
  // ignore: unused_field
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
          height: 23,
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
          height: 23,
        ),
        EditFormField(
          textCapitalization: TextCapitalization.words,
          floatingLabel: 'Full name',
          label: 'Full name',
          controller: _fullNameController,
        ),
        SizedBox(
          height: 23,
        ),
        EditFormField(
          textCapitalization: TextCapitalization.words,
          floatingLabel: 'User name',
          label: 'User name',
          controller: _userNameController,
        ),
        SizedBox(
          height: 23,
        ),
        EditFormField(
          floatingLabel: 'Phone number',
          label: 'Phone number',
          controller: _phoneNumberController,
        ),
        SizedBox(
          height: 23,
        ),
        EditFormField(
          floatingLabel: 'State/province',
          label: 'State',
          // suffixIcon: Icons.keyboard_arrow_down_sharp,
          // suffixIconColor: Pallets.disabledIconColor,
          controller: _stateController,
          // readOnly: true,
          // onTapped: () => showCustomDialog(context,
          //     title: 'Select state',
          //     items: AppConstants.getStates(), onTap: (value) {
          //   _stateSelected = true;
          //   _stateController.text = value;
          //   setState(() {});
          //   PageRouter.goBack(context);
          // }),
        ),
        // SizedBox(
        //   height: 23,
        // ),
        // EditFormField(
        //   floatingLabel: 'Country',
        //   label: 'Country',
        //   // suffixIcon: Icons.keyboard_arrow_down_sharp,
        //   // suffixIconColor: Pallets.disabledIconColor,
        //   // controller: _countryController,
        //   // readOnly: true,
        //   // onTapped: () => showCustomDialog(context,
        //   //     title: 'Select state',
        //   //     items: AppConstants.getStates(), onTap: (value) {
        //   //   _stateSelected = true;
        //   //   _stateController.text = value;
        //   //   setState(() {});
        //   //   PageRouter.goBack(context);
        //   // }),
        // ),
        SizedBox(
          height: 23,
        ),
        EditFormField(
          floatingLabel: 'Address',
          label: 'Address',
          controller: _addressController,
        ),
        SizedBox(
          height: 23,
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
          height: 23,
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
          height: 24,
        ),
        ButtonWidget(
          width: getDeviceWidth(context),
          buttonText: 'Skip & start 14 days free trial',
          color: Pallets.white,
          borderColor: Pallets.grey300,
          fontWeight: FontWeight.w200,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.grey500,
          onPressed: () => PageRouter.gotoWidget(DashboardScreen(), context),
        ),

        // Center(
        //   child: TextView(
        //     text: 'Skip & start 14 days free trial',
        //     fontWeight: FontWeight.w500,
        //     fontSize: 14,
        //     color: Pallets.grey500,
        //     textAlign: TextAlign.center,
        //     onTap: () => PageRouter.gotoWidget(DashboardScreen(), context),
        //   ),
        // ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  void _cacheTemporer(TabViewModel _tabViewModel) {
    TempBasicInformationHolder.fullName = _fullNameController.text;
    TempBasicInformationHolder.userName = _userNameController.text;
    TempBasicInformationHolder.phoneNumber = _phoneNumberController.text;
    TempBasicInformationHolder.state = _stateController.text;
    TempBasicInformationHolder.address = _addressController.text;
    TempBasicInformationHolder.sex = _sexController.text;
    TempBasicInformationHolder.dateOfBirth = _dobController.text;
    _tabViewModel.switchIndex(1);
  }
}
