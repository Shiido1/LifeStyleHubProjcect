import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/custom_dialog_menu_pop.dart';
import 'package:lifestyle_hub/ui/widgets/date_picker.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';

import 'widget/custom_radio_button.dart';

class BasicInformationsScreen extends StatefulWidget {
  final UsersProfileModel? userInfo;

  const BasicInformationsScreen(this.userInfo, {Key? key}) : super(key: key);

  @override
  _BasicInformationsScreenState createState() =>
      _BasicInformationsScreenState(userInfo);
}

class _BasicInformationsScreenState extends State<BasicInformationsScreen> {
  bool _dateSelected = false;
  bool _stateSelected = false;
  int? _radioID = 0;

  final UsersProfileModel? userInfo;

  _BasicInformationsScreenState(this.userInfo);

  TextEditingController? _fullNameController;
  TextEditingController? _phoneNumberController;
  TextEditingController? _stateController;
  TextEditingController? _addressController;
  TextEditingController? _dobController;

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController(text: userInfo?.name ?? '');
    _phoneNumberController = TextEditingController(text: userInfo?.phoneNo ?? '');
    _stateController = TextEditingController(text: userInfo?.state ?? '');
    _addressController = TextEditingController(text: userInfo?.address ?? '');
    _dobController = TextEditingController(text: userInfo?.dob ?? '');
    if (userInfo!.sex!.toLowerCase() == 'male') {
      _radioID = 0;
    } else {
      _radioID = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Basic information',
          showLeadig: true,
          showImage: false,
          showMoreMenu: true,
          centerTitle: true,
          onTap: () => null),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  EditFormField(
                    floatingLabel: 'Full name',
                    label: 'Full name',
                    controller: _fullNameController,
                    validator: Validators.validateString(),
                  ),
                  SizedBox(height: 40),
                  EditFormField(
                    floatingLabel: 'Phone number',
                    label: 'Phone number',
                    controller: _phoneNumberController,
                    validator: Validators.validatePhone(),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: RadioButton(
                        onTap: () => setState(() => _radioID = 0),
                        dynamicID: _radioID,
                        defaultID: 0,
                        title: 'Male',
                      )),
                      SizedBox(width: 23),
                      Expanded(
                          child: RadioButton(
                        onTap: () => setState(() => _radioID = 1),
                        dynamicID: _radioID,
                        defaultID: 1,
                        title: 'Female',
                      ))
                    ],
                  ),
                  SizedBox(height: 40),
                  EditFormField(
                    floatingLabel: 'State/province',
                    label: 'State',
                    suffixIcon: Icons.keyboard_arrow_down_sharp,
                    suffixIconColor: _stateSelected
                        ? Pallets.activeIconColor
                        : Pallets.disabledIconColor,
                    controller: _stateController,
                    readOnly: true,
                    onTapped: () => showCustomDialog(context,
                        title: 'Select state',
                        items: AppConstants.getStates(), onTap: (value) {
                      _stateSelected = true;
                      _stateController!.text = value;
                      setState(() {});
                      PageRouter.goBack(context);
                    }),
                  ),
                  SizedBox(height: 40),
                  EditFormField(
                    floatingLabel: 'Address',
                    label: 'Address',
                    controller: _addressController,
                    validator: Validators.validateString(),
                  ),
                  SizedBox(height: 40),
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
                          _dobController!.text = date;
                          setState(() {});
                        }),
                    controller: _dobController,
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
                    onPressed: () => null,
                  ),
                  SizedBox(height: 90),
                ],
              ),
            ),
            ButtomCountDownWidget()
          ],
        ),
      ),
    );
  }
}
