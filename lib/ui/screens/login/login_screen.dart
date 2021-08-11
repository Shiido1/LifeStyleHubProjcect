import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/helper/routes/routes.dart';
import 'package:lifestyle_hub/provider/provider_architecture.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:lifestyle_hub/utils/validators.dart';
import 'package:provider/provider.dart';

import 'viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _globalFormKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  String _emailValueDetector = '';
  String _passwordValueDetector = '';
  bool _onPasswordToggle = true;

  LoginViewModel? _login;

  @override
  void initState() {
    _login = Provider.of<LoginViewModel>(context, listen: false);
    _login!.init(context);
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
    _passwordController = TextEditingController();
  }

  /// disposes of controller
  void _disposeControllers() {
    _emailController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, loginModel, _) => LoadingOverlay(
        isLoading: loginModel.loading,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: Form(
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
                          height: 32.25,
                        ),
                        EditFormField(
                          floatingLabel: 'Password',
                          label: 'Password',
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
                          height: 24.25,
                        ),
                        TextView(
                          text: 'Forgot password',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Pallets.orange500,
                          textAlign: TextAlign.left,
                          onTap: () => PageRouter.gotoNamed(
                              Routes.resetPassword, context),
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
                          onPressed: () => _loginUser(),
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
  }

  void _loginUser() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _login!.login(
          map: LoginModel.sendData(
              email: _emailController!.text,
              password: _passwordController!.text));
    } else
      setState(() => _autoValidate = true);
  }
}
