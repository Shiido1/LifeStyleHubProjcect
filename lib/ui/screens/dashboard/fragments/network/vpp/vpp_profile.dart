import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_vpp_response.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/viewmodel/profile_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/widget/custom_radio_button.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/custom_dialog_menu_pop.dart';
import 'package:lifestyle_hub/ui/widgets/date_picker.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';

class VPPInformationsScreen extends StatefulWidget {
  final Data? lead;

  const VPPInformationsScreen(
    this.lead, {
    Key? key,
  }) : super(key: key);

  @override
  _VPPInformationsScreenState createState() => _VPPInformationsScreenState();
}

class _VPPInformationsScreenState extends State<VPPInformationsScreen> {
  final _networkProvider = ChangeNotifierProvider((_) => NetworkViewModel());
  NetworkViewModel? _networkViewModel;

  TextEditingController? _fullNameController;
  TextEditingController? _emailController;
  TextEditingController? _accountNumberController;
  TextEditingController? _bankNumberController;
  TextEditingController? _sortCodeController;
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void initState() {
    _networkViewModel = context.read(_networkProvider);
    _networkViewModel!.init(context);
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController(text: widget.lead?.name ?? '');
    _emailController = TextEditingController(text: widget.lead?.email ?? '');
    _accountNumberController =
        TextEditingController(text: widget.lead?.bank?.accountNo ?? '');
    _bankNumberController =
        TextEditingController(text: widget.lead?.bank?.name ?? '');
    _sortCodeController =
        TextEditingController(text: widget.lead?.bank?.sortCode ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      final _profileWatcher = watch(_networkProvider);
      return LoadingOverlay(
        isLoading: _profileWatcher.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: 'Update VPP',
              showLeadig: true,
              showImage: false,
              showMoreMenu: true,
              centerTitle: true,
              onTap: () => null),
          body: Form(
            key: _globalFormKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircularImage(
                        radius: 70,
                        path: widget.lead?.profilePic ?? '',
                        initial: widget.lead?.profilePic == null
                            ? widget.lead?.name?.substring(0, 2)
                            : '',
                        showInitialTextAbovePicture: true,
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Full name',
                        label: 'Full name',
                        controller: _fullNameController,
                        autoValidate: _autoValidate,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Email Address',
                        label: 'Email Address',
                        autoValidate: _autoValidate,
                        controller: _emailController,
                        validator: Validators.validateEmail(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Account Number',
                        label: 'Account Number',
                        autoValidate: _autoValidate,
                        controller: _accountNumberController,
                        readOnly: true,
                        validator: Validators.validateInt(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Bank Name',
                        label: 'Bank Name',
                        autoValidate: _autoValidate,
                        controller: _bankNumberController,
                        readOnly: true,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Sort Code',
                        label: 'Sort Code',
                        readOnly: true,
                        controller: _sortCodeController,
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              width: getDeviceWidth(context),
                              buttonText: 'Save changes',
                              color: Pallets.white,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.normal,
                              primary: Pallets.orange600,
                              onPressed: () => _updateUsersInformation(),
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: ButtonWidget(
                              width: getDeviceWidth(context),
                              buttonText: 'Cancel',
                              color: Pallets.black,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.normal,
                              primary: Pallets.grey200,
                              borderColor: Pallets.grey200,
                              onPressed: () => PageRouter.goBack(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 90),
                    ],
                  ),
                ),
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
      await _networkViewModel!.updateVPP(
          widget.lead!.id!,
          FormData.fromMap({
            '_method': 'PUT',
            'name': _fullNameController!.text,
            'email': _emailController!.text
          }));
    } else
      setState(() => _autoValidate = true);
  }
}
