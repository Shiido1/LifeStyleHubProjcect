import 'package:flutter/material.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import 'otp_screen.dart';
import '../../../../widgets/bottom_count_down.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../../utils/pallets.dart';
import '../../../../../utils/validators.dart';
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
