import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helper/helper_handler.dart';
import '../../../helper/routes/navigation.dart';
import '../../../helper/routes/routes.dart';
import 'viewmodel/login_viewmodel.dart';
import '../../widgets/buttons.dart';
import '../../widgets/edit_form_widget.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/overlay.dart';
import '../../widgets/text_views.dart';
import '../../../utils/images.dart';
import '../../../utils/pallets.dart';
import '../../../utils/validators.dart';

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
  ResetPasswordViewModel? _resetPasswordViewModel;

  @override
  void initState() {
    _resetPasswordViewModel =
        Provider.of<ResetPasswordViewModel>(context, listen: false);
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
    return Consumer<ResetPasswordViewModel>(builder: (_, watch, __) {
      return LoadingOverlay(
        isLoading: watch.loading,
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
