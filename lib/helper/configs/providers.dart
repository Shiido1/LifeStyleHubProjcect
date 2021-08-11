import 'package:lifestyle_hub/ui/screens/login/viewmodel/login_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/signup/viewmodel/signup_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<TabViewModel>(create: (_) => TabViewModel()),
    ChangeNotifierProvider<SignupViewModel>(create: (_) => SignupViewModel()),
    ChangeNotifierProvider<LoginViewmodel>(create: (_) => LoginViewmodel()),
  ];
}
