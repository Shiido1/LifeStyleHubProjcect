import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/dao/dept_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/modal.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/image_picker.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'model/dept_model.dart';

class OpenTicketScreen extends StatefulWidget {
  const OpenTicketScreen({Key? key}) : super(key: key);

  @override
  _OpenTicketScreenState createState() => _OpenTicketScreenState();
}

class _OpenTicketScreenState extends State<OpenTicketScreen> {
  final _ticketNotifier = ChangeNotifierProvider((ref) => TicketViewmodel());

  TicketViewmodel? _ticketViewmodel;
  final _deptNotifier = ChangeNotifierProvider((_) => TicketViewmodel());

  final TextEditingController _subjectDeptController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  DepartmentModel? _value;

  @override
  void initState() {
    _ticketViewmodel = context.read(_deptNotifier);
    _ticketViewmodel = context.read(_ticketNotifier);
    _ticketViewmodel!.init(context);
    _ticketViewmodel!.getTicketDepartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _response = watch(_ticketNotifier);

      return LoadingOverlay(
        isLoading: _response.loading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: getCustomAppBar(context,
                title: 'Open a ticket',
                showLeadig: true,
                centerTitle: true,
                image:
                    'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
            body: Form(
              key: _globalFormKey,
              child: ValueListenableBuilder(
                valueListenable: deptDao!.getListenable()!,
                builder: (_, Box<dynamic> box, __) {
                  List<DepartmentModel> _depts = deptDao!.convert(box).toList();
                  return Consumer(builder: (context, watch, child) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: [
                          EditFormField(
                              floatingLabel: '',
                              label: 'Subject',
                              controller: _subjectController,
                              keyboardType: TextInputType.text),
                          EditFormField(
                            floatingLabel: '',
                            label: 'Subject department',
                            controller: _subjectDeptController,
                            keyboardType: TextInputType.text,
                            onChange: (value) {},
                            readOnly: true,
                            onTapped: () => showDepartmentModal(
                                context, 'Select department', _depts,
                                onPress: (value) {
                              _subjectDeptController.text = value.name ?? '';
                              _value = value;
                              setState(() {});
                            }),
                            suffixIcon: Icons.keyboard_arrow_down,
                            suffixIconColor: Pallets.disabledIconColor,
                          ),
                          EditFormField(
                            floatingLabel: '',
                            label: 'Priority',
                            controller: _priorityController,
                            keyboardType: TextInputType.text,
                            onChange: (value) {},
                            readOnly: true,
                            onTapped: () => showOpenedTicketModal(context,
                                'Select priority', ['Low', 'Medium', 'High'],
                                onPress: (String? value) {
                              _priorityController.text = value!;
                              setState(() {});
                            }),
                            suffixIcon: Icons.keyboard_arrow_down,
                            suffixIconColor: Pallets.disabledIconColor,
                          ),
                          SizedBox(height: 23),
                          Container(
                            height: 229,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Pallets.grey100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: _messageController,
                              // ignore: missing_return
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                              },
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              enabled: true,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              cursorColor: Pallets.orange500,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: 'Type your message here'),
                            ),
                          ),
                          SizedBox(height: 24),
                          CupertinoButton(
                            onPressed: () => _loadAssets(),
                            padding: EdgeInsets.zero,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Pallets.orange500,
                                ),
                                SizedBox(width: 10),
                                TextView(
                                  text: _fileName ?? 'Attach a file',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Pallets.orange500,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  width: getDeviceWidth(context),
                                  buttonText: 'Submit',
                                  color: Pallets.white,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  fontStyle: FontStyle.normal,
                                  primary: Pallets.orange600,
                                  onPressed: () => _sendData(),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ButtonWidget(
                                  width: getDeviceWidth(context),
                                  buttonText: 'Cancel',
                                  color: Pallets.black,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  fontStyle: FontStyle.normal,
                                  primary: Pallets.grey400,
                                  borderColor: Pallets.grey400,
                                  onPressed: () => null,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 33),
                        ],
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  final _image = ImagePickerHandler();

  void _sendData() async {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      final _mappedData = await _getMappedData();
      _mappedData.fields.map((e) => logger.d(e.key)).toList();
      _ticketViewmodel!.createTicket(_mappedData);
    } else
      setState(() => _autoValidate = true);
  }

  Future<FormData> _getMappedData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'file': await MultipartFile.fromFile(_file!.path, filename: fileName),
      'subject': _subjectController.text,
      'message': _messageController.text,
      'priority': _priorityController.text,
      'department_id': _value!.id,
    });
  }

  String? _fileName;
  File? _file;

  Future<void> _loadAssets() async {
    FocusScope.of(context).unfocus();
    _image.pickImage(
        context: context,
        file: (file) {
          _file = file;
          _fileName = getFileName(file);
          setState(() {});
        });
  }
}
