import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/viewmodel/commission_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/viewmodel/contest_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/viewmodel/network_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/viewmodel/package_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../ui/screens/login/viewmodel/login_viewmodel.dart';
import '../../ui/screens/onboarding/viewmodel/information_viewmodel.dart';
import '../../ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import '../../ui/screens/signup/viewmodel/signup_viewmodel.dart';
import '../video_player.dart';

class Providers {
  static List<SingleChildWidget> getProviders = [
    ChangeNotifierProvider<TabViewModel>(create: (_) => TabViewModel()),
    ChangeNotifierProvider<RegisterViewModel>(
        create: (_) => RegisterViewModel()),
    ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
    ChangeNotifierProvider<InformationViewModel>(
        create: (_) => InformationViewModel()),
    ChangeNotifierProvider<NetworkViewModel>(create: (_) => NetworkViewModel()),
    ChangeNotifierProvider<CommissionViewmodel>(
        create: (_) => CommissionViewmodel()),
    ChangeNotifierProvider<WalletViewmodel>(create: (_) => WalletViewmodel()),
    ChangeNotifierProvider<PackageViewmodel>(create: (_) => PackageViewmodel()),
    ChangeNotifierProvider<DashboardViewmodel>(create: (_) => DashboardViewmodel()),
    ChangeNotifierProvider<ContestViewModel>(create: (_) => ContestViewModel()),
    ChangeNotifierProvider<VideoPlayer>(create: (_) => VideoPlayer()),
  ];
}
