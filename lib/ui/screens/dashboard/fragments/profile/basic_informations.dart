import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../helper/configs/constants.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import 'model/users_profile_model.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_dialog_menu_pop.dart';
import '../../../../widgets/date_picker.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/overlay.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

import 'viewmodel/profile_viewmodel.dart';
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

  final _profileProvider = ChangeNotifierProvider((_) => ProfileViewmodel());
  ProfileViewmodel? _profileViewmodel;

  TextEditingController? _fullNameController;
  TextEditingController? _phoneNumberController;
  TextEditingController? _stateController;
  TextEditingController? _addressController;
  TextEditingController? _dobController;
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void initState() {
    _initializeControllers();
    _profileViewmodel = context.read(_profileProvider);
    _profileViewmodel!.init(context);
    super.initState();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController(text: userInfo?.name ?? '');
    _phoneNumberController =
        TextEditingController(text: userInfo?.phoneNo ?? '');
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
    return Consumer(builder: (_, watch, __) {
      final _profileWatcher = watch(_profileProvider);
      return LoadingOverlay(
        isLoading: _profileWatcher.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: 'Basic information',
              showLeadig: true,
              showImage: false,
              showMoreMenu: true,
              centerTitle: true,
              onTap: () => null),
          body: Form(
            key: _globalFormKey,
            child: SafeArea(
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
                          autoValidate: _autoValidate,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Phone number',
                          label: 'Phone number',
                          autoValidate: _autoValidate,
                          controller: _phoneNumberController,
                          validator: Validators.validateString(),
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
                          autoValidate: _autoValidate,
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
                          autoValidate: _autoValidate,
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

  Future<FormData> _getMappedData() async {
    return FormData.fromMap({
      '_method': 'PATCH',
      'name': _fullNameController!.text,
      'phone_no': _phoneNumberController!.text,
      'sex': _radioID == 0 ? 'Male' : 'Female',
      'state': _stateController!.text,
      'address': _addressController!.text,
      'dob': _dobController!.text,
    });
  }

  void _updateUsersInformation() async {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      final _mappedData = await _getMappedData();
      _profileViewmodel!.updateUsersProfile({
        '_method': 'PATCH',
        'name': _fullNameController!.text,
        // 'phone_no': _phoneNumberController!.text,
        'sex': _radioID == 0 ? 'Male' : 'Female',
        'state': _stateController!.text,
        'address': _addressController!.text,
        'dob': _dobController!.text,
      });
    } else
      setState(() => _autoValidate = true);
  }
}
