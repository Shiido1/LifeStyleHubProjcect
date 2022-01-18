import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/viewmodel/package_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/image_picker.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class BankPaymentScreen extends StatefulWidget {
  final String? bankName;
  final String? accountName;
  final String? accountNumber;
  final int? id;

  BankPaymentScreen(
      {Key? key,
      required this.bankName,
      required this.accountName,
      required this.accountNumber,
      required this.id})
      : super(key: key);

  @override
  State<BankPaymentScreen> createState() => _BankPaymentScreenState();
}

class _BankPaymentScreenState extends State<BankPaymentScreen> {
  UsersProfileModel? _profileModel;
  PackageViewmodel? _packageViewmodel;
  TextEditingController? amountController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();

  void _getCachedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
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
      body: Consumer<PackageViewmodel>(
        builder: (_, provider, __) {
          return LoadingOverlay(
            isLoading: provider.loading,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: ListView(
                children: [
                  TextView(
                    text: widget.bankName ?? '',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextView(
                    text: 'Account Name: ${widget.accountName ?? ''}',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextView(
                    text: 'Account Number: ${widget.accountNumber ?? ''}',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextView(
                    text: 'Amount',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  EditFormField(
                    label: 'NGN',
                    controller: amountController,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextView(
                    text: 'Description (Optional)',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  EditFormField(
                    label: 'What’s this for?',
                    controller: descriptionController,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextView(
                    text: 'Upload  Payment  Receipt',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  EditFormField(
                    hint:
                        _file == null ? 'PDF, Jpeg, or PNG' : _file?.toString(),
                    label:
                        _file == null ? 'PDF, Jpeg, or PNG' : _file?.toString(),
                    readOnly: true,
                    suffixWidget: InkWell(
                      onTap: () => _pickImages(),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 16, bottom: 4),
                        decoration: BoxDecoration(
                            color: Pallets.orange600,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextView(
                          text: 'Select the file',
                          color: Pallets.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  ButtonWidget(
                    onPressed: () => fundWallet(),
                    buttonText: 'Make Payment',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.white,
                    primary: Pallets.orange00,
                    width: getDeviceWidth(context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  fundWallet() async {
    await _packageViewmodel!.fundWallet(formData: await _getMappedData());
  }

  final _image = ImagePickerHandler();

  File? _file;

  Future<FormData> _getMappedData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'document': await MultipartFile.fromFile(_file!.path, filename: fileName),
      'accounting_bank_id': widget.id,
      'amount': amountController!.text,
      'description': descriptionController!.text,
    });
  }

  void _pickImages() async {
    try {
      _image.pickImage(
          context: context,
          file: (file) async {
            _file = file;
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }
}
