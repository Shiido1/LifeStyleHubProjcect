import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/ui/screens/reset_password/viewmodel/login_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController? _emailController;

  String _emailValueDetector = '';

  final _resetNotifier =
      ChangeNotifierProvider((ref) => ResetPasswordViewModel());
  ResetPasswordViewModel? _resetPasswordViewModel;

  @override
  void initState() {
    _resetPasswordViewModel = context.read(_resetNotifier);
    _resetPasswordViewModel!.init(context);
    _initControllers();
    super.initState();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  /// initializes controller
  void _initControllers() {
    _emailController = TextEditingController();
  }

  /// disposes of controller
  void _disposeControllers() {
    _emailController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, watch, __) {
      final _resetWatch = watch(_resetNotifier);
      return LoadingOverlay(
        isLoading: _resetWatch.loading,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Form(
              key: _globalFormKey,
              child: Stack(
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
                            label: 'Email address',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChange: (value) =>
                                setState(() => _emailValueDetector = value),
                            prefixIcon: Icons.email_outlined,
                            prefixIconColor: _emailValueDetector.isNotEmpty
                                ? Pallets.activeIconColor
                                : Pallets.disabledIconColor,
                            autoValidate: _autoValidate,
                            validator: Validators.validateEmail(),
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
                            onPressed: () => _resetUser(),
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
                            onTap: () =>
                                PageRouter.gotoNamed(Routes.signup, context),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _resetUser() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _resetPasswordViewModel!
          .resetPassword(map: {'email': _emailController!.text});
    } else
      setState(() => _autoValidate = true);
  }
}
