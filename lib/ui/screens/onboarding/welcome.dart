import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/login/model/login_model.dart';
import 'package:lifestyle_hub/ui/screens/login/viewmodel/login_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/images.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _progress = 0;

  LoginViewModel? _login;

  @override
  void initState() {
    _login = Provider.of<LoginViewModel>(context, listen: false);
    _loginUser();
    super.initState();
  }

  /// login user
  void _loginUser() {
    _login!.init(context);
    _login!.login(
        map: LoginModel.sendData(
            email: AppConstants.tempEmail!,
            password: AppConstants.tempPassword!));
    _startTimer();
  }

  /// set timer for loading indicator
  void _startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_progress == 1) {
            timer.cancel();
            _startTimer();
          } else {
            _progress += 0.1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageLoader(
              height: 124,
              width: 124,
              path: AppImages.logo,
            ),
            SizedBox(
              height: 25,
            ),
            TextView(
              text: 'Welcome to myLifestyleHub',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Pallets.grey800,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            TextView(
              text: 'Please wait while we setup your dashboard ',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Pallets.grey700,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 76.5,
            ),
            Container(
              width: getDeviceWidth(context) / 1.2,
              height: 10,
              child: LinearProgressIndicator(
                backgroundColor: Pallets.orange100,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Pallets.orange500),
                value: _progress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
