import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/income_tile.dart';
import 'package:provider/provider.dart';

class IncomeBarChartContent extends StatefulWidget {
  @override
  State<IncomeBarChartContent> createState() => _IncomeBarChartContentState();
}

class _IncomeBarChartContentState extends State<IncomeBarChartContent> {
  ReportViewmodel? reportViewmodel;

  @override
  void initState() {
    reportViewmodel = Provider.of<ReportViewmodel>(context, listen: false);
    reportViewmodel!.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportViewmodel>(builder: (_, reportProvider, __) {
      return BarChart(
        BarChartData(
            // maxY: 1000,
            minY: 0,
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide.none,
              bottom: BorderSide.none,
            )),
            barGroups: reportProvider.barChartIncomeGroupData,
            titlesData: flIncomeTitle(context),
            gridData: flIncomeGrid(context)),
      );
    });
  }
}
