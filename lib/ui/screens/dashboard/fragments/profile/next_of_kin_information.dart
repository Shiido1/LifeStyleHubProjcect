import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/configs/constants.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import 'dao/profile_dao.dart';
import 'model/users_profile_model.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_dialog_menu_pop.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/overlay.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

import 'viewmodel/profile_viewmodel.dart';

class NextOfKinInformationScreen extends StatefulWidget {
  const NextOfKinInformationScreen({Key? key}) : super(key: key);

  @override
  _NextOfKinInformationScreenState createState() =>
      _NextOfKinInformationScreenState();
}

class _NextOfKinInformationScreenState
    extends State<NextOfKinInformationScreen> {
  ProfileViewmodel? _profileViewmodel;

  TextEditingController? _fullNameController;
  TextEditingController? _phoneNumberController;
  TextEditingController? _emailController;
  TextEditingController? _relationShipController;
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _relationshipSelected = false;
  Nok? nok;

  @override
  void initState() {
    _profileViewmodel = context.read();
    _profileViewmodel!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    nok = _profileModel?.nok;
    _initializeControllers();
    setState(() {});
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController(text: nok?.name ?? '');
    _phoneNumberController = TextEditingController(text: nok?.phoneNo ?? '');
    _emailController = TextEditingController(text: nok?.email ?? '');
    _relationShipController =
        TextEditingController(text: nok?.relationship ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewmodel>(builder: (_, watch, __) {
      return LoadingOverlay(
        isLoading: watch.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: 'Next of kin',
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
                          floatingLabel: 'Relationship',
                          label: 'Select relationship',
                          suffixIcon: Icons.keyboard_arrow_down_sharp,
                          suffixIconColor: _relationshipSelected
                              ? Pallets.activeIconColor
                              : Pallets.disabledIconColor,
                          controller: _relationShipController,
                          onTapped: () => showCustomDialog(context,
                              title: 'Select relationship',
                              items: AppConstants.getRelationship(),
                              onTap: (value) {
                            _relationshipSelected = true;
                            _relationShipController!.text = value;
                            setState(() {});
                            PageRouter.goBack(context);
                          }),
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
                        EditFormField(
                          floatingLabel: 'Email address',
                          label: 'Email address',
                          autoValidate: _autoValidate,
                          controller: _emailController,
                          validator: Validators.validateEmail(),
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
      'nok_name': _fullNameController!.text,
      'nok_relation': _relationShipController!.text,
      'nok_phone_no': _phoneNumberController!.text,
      'nok_email': _emailController!.text,
    });
  }

  void _updateUsersInformation() async {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      final _mappedData = await _getMappedData();
      _profileViewmodel!.updateUsersNextKin(_mappedData);
    } else
      setState(() => _autoValidate = true);
  }
}
