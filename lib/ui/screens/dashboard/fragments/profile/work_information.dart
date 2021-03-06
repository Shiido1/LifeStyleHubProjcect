import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../helper/helper_handler.dart';
import 'model/users_profile_model.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/overlay.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

import 'viewmodel/profile_viewmodel.dart';

class WorkInformationScreen extends StatefulWidget {
  final Work? work;

  const WorkInformationScreen(this.work, {Key? key}) : super(key: key);

  @override
  _WorkInformationScreenState createState() =>
      _WorkInformationScreenState(work);
}

class _WorkInformationScreenState extends State<WorkInformationScreen> {
  final Work? work;

  _WorkInformationScreenState(this.work);

  ProfileViewmodel? _profileViewmodel;

  TextEditingController? _occupationController;
  TextEditingController? _industryController;
  TextEditingController? _addressController;
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  // ignore: unused_field
  bool _relationshipSelected = false;

  @override
  void initState() {
    _initializeControllers();
    _profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    _profileViewmodel!.init(context);
    super.initState();
  }

  void _initializeControllers() {
    _occupationController = TextEditingController(text: work?.occupation ?? '');
    _industryController = TextEditingController(text: work?.industry ?? '');
    _addressController = TextEditingController(text: work?.address ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewmodel>(builder: (_, watch, __) {
      return LoadingOverlay(
        isLoading: watch.loading,
        child: Scaffold(
          appBar: getCustomAppBar(context,
              title: 'Work information',
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
                          floatingLabel: 'Occupation / Work',
                          label: 'Occupation / Work',
                          controller: _occupationController,
                          autoValidate: _autoValidate,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Industry',
                          label: 'Industry',
                          controller: _industryController,
                          autoValidate: _autoValidate,
                          validator: Validators.validateString(),
                        ),
                        SizedBox(height: 40),
                        EditFormField(
                          floatingLabel: 'Address',
                          label: 'Address',
                          autoValidate: _autoValidate,
                          controller: _addressController,
                          validator: Validators.validateString(),
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
                  // ButtomCountDownWidget()
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
      'occupation': _occupationController!.text,
      'industry': _industryController!.text,
      'address': _addressController!.text,
    });
  }

  void _updateUsersInformation() async {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      final _mappedData = await _getMappedData();
      _profileViewmodel!.updateUsersWorkInfo(_mappedData);
    } else
      setState(() => _autoValidate = true);
  }
}
