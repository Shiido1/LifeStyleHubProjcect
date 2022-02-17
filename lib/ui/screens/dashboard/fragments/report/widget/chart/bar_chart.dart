import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/sign_up_tile.dart';
import 'package:provider/provider.dart';

class BarChartContent extends StatefulWidget {
  @override
  State<BarChartContent> createState() => _BarChartContentState();
}

class _BarChartContentState extends State<BarChartContent> {
  ReportViewmodel? reportViewmodel;

  @override
  void initState() {
    reportViewmodel = Provider.of<ReportViewmodel>(context, listen: false);
    reportViewmodel!.init(context);
    reportViewmodel!.freeSignUpModelRes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportViewmodel>(builder: (_, reportProvider, __) {
      return BarChart(
        BarChartData(
            // maxY: 10,
            minY: 0,
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide.none,
              bottom: BorderSide.none,
            )),
            barGroups: reportProvider.barChartGroupData,
            titlesData: flSignUpTitle(context),
            gridData: flSignUpGrid(context)),
      );
    });
  }
}
