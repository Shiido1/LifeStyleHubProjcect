import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/tabs/promotion_tab.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'tabs/vpp_tab.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: TabBar(
              labelColor: Pallets.grey800,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              unselectedLabelColor: Pallets.grey400,
              unselectedLabelStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'My promotion'),
                Tab(text: 'My VPP Report'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PromotionTab(),
            VPPTab(),
          ],
        ),
      ),
    );
  }
}
