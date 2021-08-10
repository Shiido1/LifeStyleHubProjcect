import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageLoader(
                    path: AppImages.logo,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 61),
                  TextView(
                    text: 'Reset password',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextView(
                    text:
                        'Enter the email address you used during registration',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Pallets.grey700,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 32.25,
                  ),
                  EditFormField(
                    floatingLabel: 'Email address',
                    label: 'Enter email',
                    prefixIcon: Icons.email_outlined,
                    prefixIconColor: Pallets.disabledIconColor,
                  ),
                  SizedBox(
                    height: 35.25,
                  ),
                  ButtonWidget(
                    width: getDeviceWidth(context),
                    buttonText: 'Reset my password',
                    color: Pallets.white,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.normal,
                    primary: Pallets.orange600,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 23),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Don’t have an account?',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  TextView(
                    text: 'Register here',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.orange500,
                    textAlign: TextAlign.center,
                    onTap: () => PageRouter.gotoNamed(Routes.signup, context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
