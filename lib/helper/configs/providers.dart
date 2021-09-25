import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../ui/screens/login/viewmodel/login_viewmodel.dart';
import '../../ui/screens/onboarding/viewmodel/information_viewmodel.dart';
import '../../ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import '../../ui/screens/signup/viewmodel/signup_viewmodel.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<TabViewModel>(create: (_) => TabViewModel()),
    ChangeNotifierProvider<RegisterViewModel>(
        create: (_) => RegisterViewModel()),
    ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
    ChangeNotifierProvider<InformationViewModel>(
        create: (_) => InformationViewModel()),
  ];
}
