import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/src/provider.dart';
import '../../../../../helper/helper_handler.dart';
import 'model/change_password.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/overlay.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';

import 'viewmodel/profile_viewmodel.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  var _passwordKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final _profileProvider = ChangeNotifierProvider((_) => ProfileViewmodel());
  ProfileViewmodel? _profileViewmodel;

  final TextEditingController _current = TextEditingController();
  final TextEditingController _new = TextEditingController();
  final TextEditingController _confirm = TextEditingController();

  @override
  void initState() {
    _profileViewmodel = context.read();
    _profileViewmodel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(
          context,
          title: 'Change password',
          showLeadig: true,
          centerTitle: true,
          showImage: false,
        ),
        body: Consumer(builder: (_, watch, __) {
          final _profileWatch = watch.watch(_profileProvider);
          return LoadingOverlay(
            isLoading: _profileWatch.loading,
            child: SafeArea(
              child: Stack(
                children: [
                  Form(
                    key: _globalFormKey,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 23),
                            EditFormField(
                              floatingLabel: 'Enter current password',
                              label: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              autoValidate: _autoValidate,
                              controller: _current,
                              validator: Validators.validatePlainPassword()!,
                            ),
                            SizedBox(height: 23),
                            EditFormField(
                              floatingLabel: 'Enter new password',
                              label: 'Password',
                              formKey: _passwordKey,
                              controller: _new,
                              keyboardType: TextInputType.visiblePassword,
                              autoValidate: _autoValidate,
                              validator: Validators.validatePlainPassword(
                                  error: 'New password is required')!,
                            ),
                            SizedBox(height: 23),
                            EditFormField(
                              floatingLabel: 'Re-enter new password',
                              label: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              controller: _confirm,
                              autoValidate: _autoValidate,
                              validator: Validators.validatePlainPassword(
                                  error:
                                      'Confirm the new password you have entered')!,
                            ),
                            SizedBox(
                              height: 36.25,
                            ),
                            ButtonWidget(
                              width: getDeviceWidth(context),
                              buttonText: 'Save changes',
                              color: Pallets.white,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              fontStyle: FontStyle.normal,
                              primary: Pallets.orange600,
                              onPressed: () => _confirmPasswordChange(),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ButtomCountDownWidget()
                ],
              ),
            ),
          );
        }));
  }

  void _confirmPasswordChange() {
    FocusScope.of(context).unfocus();
    final _usersPassword = ChangePassword(
        currentPassword: _current.text,
        newPassword: _new.text,
        newConfirmationPassword: _confirm.text);
    if (_globalFormKey.currentState!.validate()) {
      _profileViewmodel!.changeUsersPassword(_usersPassword.toJson());
    } else
      setState(() => _autoValidate = true);
  }
}
