// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/login/login_screen.dart';
import 'package:page_transition/page_transition.dart';

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
    CommissionScreen(),
    ContestScreen(),
    Container(), // Report
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
        // await HiveBoxes.logOut();
        // PageRouter.gotoWidget(LoginScreen(), context,
        //     clearStack: true, animationType: PageTransitionType.fade);
      }
    });
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: _titleList[_index],
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
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
