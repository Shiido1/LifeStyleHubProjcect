// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// ignore: deprecated_member_use, unused_import
// import 'package:flutter_riverpod/all.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/leadership/leadership_page.dart';
import 'package:lifestyle_hub/ui/screens/notifications/viewmodel/notification_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_count_down.dart';
import '../../widgets/custom_appbar.dart';
import 'fragments/commission/commission_screen.dart';
import 'fragments/contest/contest_screen.dart';
import 'fragments/home/home_screen.dart';
import 'fragments/integrated/integrated_point_screen.dart';
import 'fragments/marketting/marketting_screen.dart';
import 'fragments/messaging/messaging_screen.dart';
import 'fragments/network/network_screen.dart';
import 'fragments/profile/dao/profile_dao.dart';
import 'fragments/profile/model/users_profile_model.dart';
import 'fragments/profile/profile_screen.dart';
import 'fragments/report/report_screen.dart';
import 'fragments/ticket/ticket_screen.dart';
import 'fragments/wallet/wallet_screen.dart';
import 'widget/drawer_widget.dart';

class UserLoggedInEvent {
  String? message;
  bool? logUserOut;

  UserLoggedInEvent({this.logUserOut = false, this.message});
}

class DashboardScreen extends StatefulWidget {
  int index;

  DashboardScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState(index);
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _body = [
    HomeScreen(),
    MarkettingScreen(),
    NetworkScreen(),
    LeadershipScreen(),
    CommissionScreen(),
    ContestScreen(),
    ReportScreen(),
    WalletScreen(),
    IntegratedPointScreen(),
    MessagingScreen(),
    TicketScreen(),
    ProfileScreen()
  ];

  List<String> _titleList = [
    'Dashboard',
    'Marketting Tools',
    'My network',
    'Leadership program',
    'My commission',
    'Contest & Reward',
    'Report',
    'Wallet',
    'Integrated point',
    'Messaging',
    'Ticketting',
    'My profile'
  ];

  int _index = 0;

  _DashboardScreenState(this._index);

  @override
  void initState() {
    eventBus.on().listen((event) async {
      if (event is UserLoggedInEvent && event.logUserOut!) {
        Provider.of<TabViewModel>(context, listen: false).resetIndex();
        HiveBoxes.logOut(context);
      }
    });
    _getCatchedInfos();
    Provider.of<NotificationViewmodel>(context, listen: false).notification();

    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao?.convert();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // _getCatchedInfos();
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: _titleList[_index],
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH',
          onTap: () => PageRouter.gotoWidget(
              DashboardScreen(index: 10), context,
              animationType: PageTransitionType.fade, clearStack: true)),
      drawer: getDrawer(context, _index, _profileModel),
      body: SafeArea(
        child: Stack(
          children: [
            _body[_index],
            ButtomCountDownWidget(),
          ],
        ),
      ),
    );
  }
}
