import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/information_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_dialog_menu_pop.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'model/temp_basic_information_model.dart';

class NextOfKinInformationWidget extends StatefulWidget {
  const NextOfKinInformationWidget({Key? key}) : super(key: key);

  @override
  _NextOfKinInformationWidgetState createState() =>
      _NextOfKinInformationWidgetState();
}

class _NextOfKinInformationWidgetState
    extends State<NextOfKinInformationWidget> {
  TextEditingController _nxtFullName =
  TextEditingController(text: TempBasicInformationHolder.nxtFullName ?? '');
  TextEditingController _nxtRelationshipController = TextEditingController(
      text: TempBasicInformationHolder.nxtRelationship ?? '');
  TextEditingController _nxtPhoneNumberController =
  TextEditingController(text: TempBasicInformationHolder.nxtPhoneNumber ?? '');
  TextEditingController _nxtEmailController =
  TextEditingController(text: TempBasicInformationHolder.nxtEmail ?? '');

  bool _relationshipSelected = false;

  InformationViewModel? _informationModel;

  @override
  void initState() {
    _informationModel = Provider.of<InformationViewModel>(context, listen: false);
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
          text: 'Next of Kin Information',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Pallets.grey800,
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Next of kin full name',
          label: 'Next of kin full name',
          controller: _nxtFullName,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Relationship',
          label: 'Select relationship',
          suffixIcon: Icons.keyboard_arrow_down_sharp,
          suffixIconColor: _relationshipSelected ? Pallets.activeIconColor : Pallets.disabledIconColor,
          controller: _nxtRelationshipController,
          onTapped: () => showCustomDialog(context,
              title: 'Select relationship', items: AppConstants.getRelationship(), onTap: (value) {
                _relationshipSelected = true;
                _nxtRelationshipController.text = value;
                setState(() {});
                PageRouter.goBack(context);
              }),
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Next of kin phone number',
          label: 'Phone number',
          controller: _nxtPhoneNumberController,
        ),
        SizedBox(
          height: 8,
        ),
        EditFormField(
          floatingLabel: 'Email address',
          label: 'Email address',
          controller: _nxtEmailController,
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
          buttonText: 'Next',
          color: Pallets.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
          primary: Pallets.orange600,
          onPressed: () => _makeRequest(_tabViewModel),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  void _cacheTemporer(_tabViewModel) {
    TempBasicInformationHolder.nxtFullName = _nxtFullName.text;
    TempBasicInformationHolder.nxtPhoneNumber = _nxtPhoneNumberController.text;
    TempBasicInformationHolder.nxtRelationship =
        _nxtRelationshipController.text;
    TempBasicInformationHolder.nxtEmail = _nxtEmailController.text;
    _tabViewModel.switchIndex(0);
  }

  void _makeRequest(TabViewModel _tabViewModel) async {
    bool _value = await _informationModel!.registerBasicInformation(
        map: TempBasicInformationHolder.sendData(
            name: TempBasicInformationHolder.fullName!,
            phoneNumber: TempBasicInformationHolder.phoneNumber!,
            state: TempBasicInformationHolder.state!,
            address: TempBasicInformationHolder.address!,
            sex: TempBasicInformationHolder.sex!,
            dob: TempBasicInformationHolder.dateOfBirth!,
            nameOfNextOfKin: _nxtFullName.text,
            relationshipOfNextOfKin: _nxtRelationshipController.text,
            phoneOfNextOfKin: _nxtPhoneNumberController.text,
            emailOfNextOfKin: _nxtEmailController.text));
    if (_value)
      _tabViewModel.switchIndex(2);
  }
}
