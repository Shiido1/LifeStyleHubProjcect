import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/otp_screen.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:page_transition/page_transition.dart';

class ChangePINScreen extends StatefulWidget {
  const ChangePINScreen({Key? key}) : super(key: key);

  @override
  _ChangePINScreenState createState() => _ChangePINScreenState();
}

class _ChangePINScreenState extends State<ChangePINScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(
        context,
        title: 'Reset transaction pin',
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
                        floatingLabel: 'Enter email address',
                        label: 'Enter email address to reset',
                        keyboardType: TextInputType.emailAddress,
                        autoValidate: _autoValidate,
                        validator: Validators.validateEmail()!,
                      ),
                      SizedBox(
                        height: 36.25,
                      ),
                      ButtonWidget(
                        width: getDeviceWidth(context),
                        buttonText: 'Send OTP',
                        color: Pallets.white,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        fontStyle: FontStyle.normal,
                        primary: Pallets.orange600,
                        onPressed: () => PageRouter.gotoWidget(
                            OtpScreen(), context,
                            animationType: PageTransitionType.fade),
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
