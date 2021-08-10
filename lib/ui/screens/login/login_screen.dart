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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    text: 'Login into myLifestyleHub',
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
                        'Login with your data that you entered during your registration.',
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
                    label: 'Email address',
                    prefixIcon: Icons.email_outlined,
                    prefixIconColor: Pallets.activeIconColor,
                  ),
                  SizedBox(
                    height: 32.25,
                  ),
                  EditFormField(
                    floatingLabel: 'Password',
                    label: 'Password',
                    prefixIcon: Icons.lock_outline,
                    prefixIconColor: Pallets.disabledIconColor,
                    suffixIcon: Icons.visibility_outlined,
                    suffixIconColor: Pallets.disabledIconColor,
                  ),
                  SizedBox(
                    height: 24.25,
                  ),
                  TextView(
                    text: 'Forgot password',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.orange500,
                    textAlign: TextAlign.left,
                    onTap: () =>
                        PageRouter.gotoNamed(Routes.resetPassword, context),
                  ),
                  SizedBox(
                    height: 36.25,
                  ),
                  ButtonWidget(
                    width: getDeviceWidth(context),
                    buttonText: 'Login now',
                    color: Pallets.white,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontStyle: FontStyle.normal,
                    primary: Pallets.orange600,
                    onPressed: () =>
                        PageRouter.gotoNamed(Routes.welcome, context),
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
