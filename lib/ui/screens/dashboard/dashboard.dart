import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/home_screen.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';

import 'fragments/marketting_screen.dart';
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
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  int _index = 0;

  _DashboardScreenState(this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: '',
          showLeadig: true,
          image:
              'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'),
      drawer: getDrawer(context),
      body: Stack(
        children: [_body[_index], ButtomCountDownWidget()],
      ),
    );
  }
}
