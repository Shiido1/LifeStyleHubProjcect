import 'package:lifestyle_hub/ui/screens/onboarding/provider/tab_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<TabViewModel>(create: (_) => TabViewModel()),
  ];
}
