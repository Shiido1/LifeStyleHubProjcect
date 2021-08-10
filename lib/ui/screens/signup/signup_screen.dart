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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
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
                text: 'Sign up to myLifestyleHub',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Pallets.grey800,
                textAlign: TextAlign.center,
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
                floatingLabel: 'Enter referral code (If any)',
                label: 'Referral code (if any)',
                prefixIcon: Icons.share_outlined,
                prefixIconColor: Pallets.disabledIconColor,
              ),
              SizedBox(
                height: 32.25,
              ),
              EditFormField(
                floatingLabel: 'Email address',
                label: 'Email address',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(
                height: 32.25,
              ),
              EditFormField(
                floatingLabel: 'Enter password',
                label: 'Enter password',
                prefixIcon: Icons.lock_outline,
                prefixIconColor: Pallets.disabledIconColor,
                suffixIcon: Icons.visibility_outlined,
                suffixIconColor: Pallets.disabledIconColor,
              ),
              SizedBox(
                height: 32.25,
              ),
              EditFormField(
                floatingLabel: 'Re-enter password',
                label: 'Re-enter password',
                prefixIcon: Icons.lock_outline,
                prefixIconColor: Pallets.disabledIconColor,
                suffixIcon: Icons.visibility_outlined,
                suffixIconColor: Pallets.disabledIconColor,
              ),
              SizedBox(
                height: 64,
              ),
              ButtonWidget(
                width: getDeviceWidth(context),
                buttonText: 'Get started',
                color: Pallets.white,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                primary: Pallets.orange600,
                onPressed: () =>
                    PageRouter.gotoNamed(Routes.getStarted, context),
              ),
              SizedBox(
                height: 67,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Already have an account?',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Pallets.grey700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  TextView(
                    text: 'Login here',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Pallets.orange500,
                    textAlign: TextAlign.center,
                    onTap: () => PageRouter.gotoNamed(Routes.login, context),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
