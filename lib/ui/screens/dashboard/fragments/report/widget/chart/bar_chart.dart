import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/chart_data/bar_chart_data.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/left_tile.dart';

class BarChartContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BarChart(

      BarChartData(
            maxY: 1000,
            minY: 0,
        borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide.none,
              bottom: BorderSide.none,
            )),
        barGroups:barChartGroupData,
        titlesData: flTitle(context),
        gridData: flGrid(context)
        ),
      );
  }
}