import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

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
      body: SafeArea(
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
                        validator: Validators.validatePlainPassword()!,
                      ),
                      SizedBox(height: 23),
                      EditFormField(
                        floatingLabel: 'Enter new password',
                        label: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        autoValidate: _autoValidate,
                        validator: Validators.validatePlainPassword()!,
                      ),
                      SizedBox(height: 23),
                      EditFormField(
                        floatingLabel: 'Re-enter new password',
                        label: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        autoValidate: _autoValidate,
                        validator: Validators.validatePlainPassword()!,
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
                        onPressed: () => null,
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
  }
}
