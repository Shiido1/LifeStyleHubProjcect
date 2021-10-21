import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphTTest extends StatefulWidget {
  GraphTTest({Key? key}) : super(key: key);

  @override
  State<GraphTTest> createState() => _GraphTTestState();
}

class _GraphTTestState extends State<GraphTTest> {
  final List<FlSpot> dummyData1 = List.generate(10, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(10, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          margin: EdgeInsets.only(right: 24),
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                  show: true,
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false)),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Color(0xffECE9F1),
                    strokeWidth: 1,
                  );
                },
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.red,
                  ],
                ),
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.orange,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
