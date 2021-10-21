import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/viewmodel/package_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/tabs/promotion_tab.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  PackageViewmodel? _packageViewmodel;

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
            Text('asas'),
          ],
        ),
      ),
    );
  }
}
