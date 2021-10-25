import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';

_leftTitles(BuildContext context) {
  return SideTitles(
      showTitles: true,
      getTitles: (value) {
        return formatCurrency(value);
      },
      getTextStyles: (context, size) => TextStyle(fontSize: 14),
      reservedSize: getDeviceWidth(context) / 9);
}

_bottomTitles(BuildContext context) {
  return SideTitles(
      showTitles: true,
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return 'Jan';
          case 2:
            return 'Fab';
          case 3:
            return 'Mar';
          case 4:
            return 'Apr';
          case 5:
            return 'May';
          case 6:
            return 'June';
          case 7:
            return 'July';
          case 9:
            return 'Aug';
          case 10:
            return 'Sept';
          case 11:
            return 'Oct';
          case 11:
            return 'Nov';
          case 12:
            return 'Dec';
        }
        return '';
      },
      margin: 20);
}

flTitle(BuildContext context) {
  return FlTitlesData(
    show: true,
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(
      showTitles: true,
      reservedSize: getDeviceWidth(context) / 112,
      getTitles: (value) {
        return '';
      },
    ),
    leftTitles: _leftTitles(context),
    bottomTitles: _bottomTitles(context),
  );
}

flGrid(BuildContext context) {
  return FlGridData(
    show: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        color: Color(0xffECE9F1),
        strokeWidth: 1,
      );
    },
  );
}
