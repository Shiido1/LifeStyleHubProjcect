import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/model/my_vpp_response.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/utils/image_picker.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';

class VPPInformationsScreen extends StatefulWidget {
  final Data? lead;
  final bool? isUpdate;

  const VPPInformationsScreen(this.lead, {Key? key, this.isUpdate = false})
      : super(key: key);

  @override
  _VPPInformationsScreenState createState() => _VPPInformationsScreenState();
}

class _VPPInformationsScreenState extends State<VPPInformationsScreen> {
  NetworkViewModel? _networkViewModel;

  TextEditingController? _fullNameController;
  TextEditingController? _emailController;
  TextEditingController? _bankNumberController;
  TextEditingController? _accountNumberController;
  TextEditingController? _accountNameController = TextEditingController();
  TextEditingController? _sortCodeController;
  TextEditingController? _phoneController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _currency = TextEditingController();

  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _password = false;

  @override
  void initState() {
    _networkViewModel = Provider.of<NetworkViewModel>(context, listen: false);
    _networkViewModel!.init(context);
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController(text: widget.lead?.name ?? '');
    _emailController = TextEditingController(text: widget.lead?.email ?? '');
    _accountNameController =
        TextEditingController(text: widget.lead?.bank?.accountName ?? '');
    _accountNumberController =
        TextEditingController(text: widget.lead?.bank?.accountNo ?? '');
    _bankNumberController =
        TextEditingController(text: widget.lead?.bank?.name ?? '');
    _sortCodeController =
        TextEditingController(text: widget.lead?.bank?.sortCode ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkViewModel>(builder: (_, watch, __) {
      return LoadingOverlay(
        isLoading: watch.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: '${widget.isUpdate! ? 'Update' : 'Register'} VPP',
              showLeadig: true,
              showImage: false,
              showMoreMenu: true,
              centerTitle: true,
              onTap: () => null),
          body: Form(
            key: _globalFormKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(23.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _file != null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(_file!),
                            )
                          : CircularImage(
                              radius: 70,
                              path: widget.lead?.profilePic ?? '',
                              initial: widget.lead?.profilePic == null
                                  ? widget.lead?.name?.substring(0, 2)
                                  : '',
                              showInitialTextAbovePicture: true,
                              onTap: () => _pickImages(),
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
                        floatingLabel: 'Account Name',
                        label: 'Account Name',
                        autoValidate: _autoValidate,
                        controller: _accountNameController,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Account Number',
                        label: 'Account Number',
                        autoValidate: _autoValidate,
                        controller: _accountNumberController,
                        validator: Validators.validateInt(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Bank Name',
                        label: 'Bank Name',
                        autoValidate: _autoValidate,
                        controller: _bankNumberController,
                        validator: Validators.validateString(),
                      ),
                      SizedBox(height: 40),
                      EditFormField(
                        floatingLabel: 'Sort Code',
                        label: 'Sort Code',
                        controller: _sortCodeController,
                      ),
                      SizedBox(height: 40),
                      Visibility(
                        visible: !widget.isUpdate!,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EditFormField(
                              floatingLabel: 'Phone Number',
                              label: 'Phone Number',
                              controller: _phoneController,
                            ),
                            SizedBox(height: 40),
                            EditFormField(
                              floatingLabel: 'Currency',
                              label: 'Currency',
                              controller: _currency,
                            ),
                            SizedBox(height: 40),
                            EditFormField(
                              floatingLabel: 'Password',
                              label: 'Password',
                              controller: _passwordController,
                              obscureText: _password,
                              suffixIcon: _password
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              onPasswordToggle: () =>
                                  setState(() => _password = !_password),
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
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
      !widget.isUpdate!
          ? await _networkViewModel!.registerVpp(await _registerMappData())
          : await _networkViewModel!.updateVPP(
              widget.lead!.id!,
              FormData.fromMap({
                '_method': 'PUT',
                'name': _fullNameController!.text,
                'email': _emailController!.text
              }));
    } else
      setState(() => _autoValidate = true);
  }

  final _image = ImagePickerHandler();

  File? _file;

  Future<FormData> _registerMappData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'profile_pic':
          await MultipartFile.fromFile(_file!.path, filename: fileName),
      'name': _fullNameController!.text,
      'password': _passwordController!.text,
      'email': _emailController!.text,
      'password_confirmation': _passwordController!.text,
      'phone_no': _phoneController!.text,
      'bank_name': _bankNumberController!.text,
      'account_name': _accountNameController!.text,
      'account_no': _accountNumberController!.text,
      'currency': _currency!.text
    });
  }

  Future<FormData> _getMappedData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'profile_pic':
          await MultipartFile.fromFile(_file!.path, filename: fileName),
      '_method': 'PUT',
    });
  }

  void _pickImages() async {
    try {
      _image.pickImage(
          context: context,
          file: (file) async {
            _file = file;
            if (widget.isUpdate!) {
              await _networkViewModel!
                  .updateVPP(widget.lead!.id!, await _getMappedData());
              _networkViewModel!.getUsersVPP();
            }
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }
}
