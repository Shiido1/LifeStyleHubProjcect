import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/provider/_viewmodel_provider.dart';
import 'package:lifestyle_hub/ui/screens/signup/viewmodel/signup_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';

import 'model/register_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  var _globalFormFieldState = GlobalKey<FormFieldState>();

  bool _autoValidate = false;

  final TextEditingController _referralCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController =
      TextEditingController();

  bool _onPasswordToggle = true;
  bool _onResetPasswordToggle = true;

  String _referralCodeValueDetector = '';
  String _emailValueDetector = '';
  String _reEnterPasswordValueDetector = '';
  String _passwordValueDetector = '';

  RegisterViewModel? _registerViewModel;

  @override
  void initState() {
    _registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    _registerViewModel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RegisterViewModel>.withConsumer(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) => LoadingOverlay(
        isLoading: viewModel.loading,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _globalFormKey,
            child: SingleChildScrollView(
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
                    EditFormField(
                      floatingLabel: 'Enter referral code (If any)',
                      label: 'Referral code (if any)',
                      controller: _referralCodeController,
                      keyboardType: TextInputType.text,
                      onChange: (value) =>
                          setState(() => _referralCodeValueDetector = value),
                      prefixIcon: Icons.share_outlined,
                      prefixIconColor: _referralCodeValueDetector.isNotEmpty
                          ? Pallets.activeIconColor
                          : Pallets.disabledIconColor,
                    ),
                    SizedBox(
                      height: 8,
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
                      height: 8,
                    ),
                    EditFormField(
                      floatingLabel: 'Enter password',
                      label: 'Enter password',
                      formKey: _globalFormFieldState,
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      obscureText: _onPasswordToggle,
                      onChange: (value) =>
                          setState(() => _passwordValueDetector = value),
                      onPasswordToggle: () => setState(
                          () => _onPasswordToggle = !_onPasswordToggle),
                      prefixIcon: Icons.lock_outline,
                      prefixIconColor: _passwordValueDetector.isNotEmpty
                          ? Pallets.activeIconColor
                          : Pallets.disabledIconColor,
                      suffixIcon: _onPasswordToggle
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      suffixIconColor: _passwordValueDetector.isNotEmpty
                          ? Pallets.activeIconColor
                          : Pallets.disabledIconColor,
                      autoValidate: _autoValidate,
                      validator: Validators.validatePlainPassword()!,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    EditFormField(
                      floatingLabel: 'Re-enter password',
                      label: 'Re-enter password',
                      keyboardType: TextInputType.text,
                      controller: _reEnterPasswordController,
                      obscureText: _onResetPasswordToggle,
                      onChange: (value) =>
                          setState(() => _reEnterPasswordValueDetector = value),
                      onPasswordToggle: () => setState(() =>
                          _onResetPasswordToggle = !_onResetPasswordToggle),
                      prefixIcon: Icons.lock_outline,
                      prefixIconColor: _reEnterPasswordValueDetector.isNotEmpty
                          ? Pallets.activeIconColor
                          : Pallets.disabledIconColor,
                      suffixIcon: _onResetPasswordToggle
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      suffixIconColor: _reEnterPasswordValueDetector.isNotEmpty
                          ? Pallets.activeIconColor
                          : Pallets.disabledIconColor,
                      autoValidate: _autoValidate,
                      validator:
                          Validators.validateMainPasswordWithConfirmPassword(
                              _globalFormFieldState.currentState),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Get started',
                      color: Pallets.white,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.orange600,
                      onPressed: () => _registerUser(),
                    ),
                    SizedBox(
                      height: 23,
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
                          width: 8,
                        ),
                        TextView(
                          text: 'Login here',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Pallets.orange500,
                          textAlign: TextAlign.center,
                          onTap: () =>
                              PageRouter.gotoNamed(Routes.login, context),
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
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _registerViewModel!.register(
          map: RegisterModel.sendData(
              email: _emailController.text,
              password: _passwordController.text,
              passwordConfirmation: _reEnterPasswordController.text,
              referral: _referralCodeController.text));
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
