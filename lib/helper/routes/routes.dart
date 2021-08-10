import 'package:flutter/cupertino.dart';
import 'package:lifestyle_hub/ui/screens/login/login_screen.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/informations.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/splashscreen.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/welcome.dart';
import 'package:lifestyle_hub/ui/screens/reset_password/reset_password_screen.dart';
import 'package:lifestyle_hub/ui/screens/signup/signup_screen.dart';

BuildContext? globalContext;

class Routes {
  static const String splash = '/splashscreen';
  static const String login = '/login';
  static const String resetPassword = '/resetPassword';
  static const String signup = '/signup';
  static const String getStarted = '/getStarted';
  static const String welcome = '/welcome';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        splash: (BuildContext context) {
          globalContext = context;
          return SplashScreen();
        },
        login: (BuildContext context) {
          globalContext = context;
          return LoginScreen();
        },
        resetPassword: (BuildContext context) {
          globalContext = context;
          return ResetPasswordScreen();
        },
        signup: (BuildContext context) {
          globalContext = context;
          return SignupScreen();
        },
        getStarted: (BuildContext context) {
          globalContext = context;
          return GetStartedScreen();
        },
        welcome: (BuildContext context) {
          globalContext = context;
          return WelcomeScreen();
        },
      };
}
