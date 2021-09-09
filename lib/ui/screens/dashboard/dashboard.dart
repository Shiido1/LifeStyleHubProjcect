import 'package:flutter/material.dart';
import '../../../helper/configs/instances.dart';
import 'fragments/home/home_screen.dart';
import 'fragments/profile/profile_screen.dart';
import '../../widgets/bottom_count_down.dart';
import '../../widgets/custom_appbar.dart';

import 'fragments/commission/commission_screen.dart';
import 'fragments/contest/contest_screen.dart';
import 'fragments/integrated/integrated_point_screen.dart';
import 'fragments/marketting/marketting_screen.dart';
import 'fragments/messaging/messaging_screen.dart';
import 'fragments/network/network_screen.dart';
import 'fragments/ticket/ticket_screen.dart';
import 'fragments/wallet/wallet_screen.dart';
import 'widget/drawer_widget.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: _titleList[_index],
          showLeadig: true,
          centerTitle: true,
          image:
              'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
      drawer: getDrawer(context, _index),
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
