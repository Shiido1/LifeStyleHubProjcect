import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../helper/helper_handler.dart';
import '../../../helper/routes/navigation.dart';
import '../../../helper/routes/routes.dart';
import 'model/login_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/edit_form_widget.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/overlay.dart';
import '../../widgets/text_views.dart';
import '../../../utils/images.dart';
import '../../../utils/pallets.dart';
import '../../../utils/validators.dart';

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

  final _loginNotifier = ChangeNotifierProvider((ref) => LoginViewModel());
  LoginViewModel? _loginViewModel;

  @override
  void initState() {
    _loginViewModel = context.read(_loginNotifier);
    _loginViewModel!.init(context);
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
    return Consumer(
      builder: (context, watch, child) {
        _loginViewModel = watch(_loginNotifier);
        return LoadingOverlay(
          isLoading: _loginViewModel!.loading,
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
                            Routes.resetPassword, context,
                            clearStack: true),
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
                      SizedBox(
                        height: 23,
                      ),
                      Row(
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
                      SizedBox(
                        height: 23,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _loginUser() {
    FocusScope.of(context).unfocus();
    if (_globalFormKey.currentState!.validate()) {
      _loginViewModel!.login(
          map: LoginModel.sendData(
              email: _emailController!.text,
              password: _passwordController!.text));
    } else
      setState(() => _autoValidate = true);
  }
}
