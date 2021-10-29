import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/image_picker.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class BankPaymentScreen extends StatefulWidget {
  final String? bankName;
  final String? accountName;
  final String? accountNumber;

  BankPaymentScreen(
      {Key? key,
        required this.bankName,
        required this.accountName,
        required this.accountNumber}) : super(key: key);

  @override
  State<BankPaymentScreen> createState() => _BankPaymentScreenState();
}

class _BankPaymentScreenState extends State<BankPaymentScreen> {

  UsersProfileModel? _profileModel;

  void _getCachedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  void initState() {
    _getCachedInfos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Bank Payment',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: widget.bankName??'',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Pallets.grey800,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8,),
              TextView(
                text: 'Account Name: ${widget.accountName??''}',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8,),
              TextView(
                text: 'Account Number: ${widget.accountNumber??''}',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24,),
              TextView(
                text: 'Amount',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
              ),
              EditFormField(
                label: 'NGN',
              ),
              SizedBox(height: 24,),
              TextView(
                text: 'Description (Optional)',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
              ),
              EditFormField(
                label: 'What’s this for?',
              ),
              SizedBox(height: 24,),
              TextView(
                text: 'Upload  Payment  Receipt',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
              ),
              EditFormField(
                label: _imgFile==null || _imgFile!.isEmpty?'PDF, Jpeg, or PNG':_imgFile,
                readOnly: true,
                suffixWidget: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ButtonWidget(
                    onPressed: ()=>_pickImages(),
                    buttonText: 'Select the file',
                    fontSize: 14,
                    width: 120,
                    fontWeight: FontWeight.w500,
                    color: Pallets.white,
                    primary: Pallets.orange00,
                  ),
                ),
              ),
              SizedBox(height: 56,),
              ButtonWidget(
                onPressed: () {},
                buttonText: 'Make Payment',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Pallets.white,
                primary:Pallets.orange00,
                width: getDeviceWidth(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  final _image = ImagePickerHandler();

  File? _file;
  String? _imgFile='';

  Future<FormData> _getMappedData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'profile_pic':
      await MultipartFile.fromFile(_file!.path, filename: fileName),
      '_method': 'PATCH',
    });
  }

  void _pickImages() async {
    try {
      _image.pickImage(
          context: context,
          file: (file) async {
            _file = file;
            _imgFile = _file.toString();
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }
}
