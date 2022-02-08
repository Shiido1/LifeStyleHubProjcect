import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

_leftTitles(BuildContext context) {
  return SideTitles(
      interval: 2,
      showTitles: true,
      getTitles: (value) {
        switch (value.toInt()) {
        }
        return value.toString();
      },
      getTextStyles: (context, size) => TextStyle(fontSize: 14),
      reservedSize: getDeviceWidth(context) / 9);
}

_bottomTitles(BuildContext context) {
  return SideTitles(
      showTitles: true,
      getTitles: (value) {
        switch (value.toInt()) {
          case 0:
            return 'Jan';
          case 1:
            return 'Feb';
          case 2:
            return 'Mar';
          case 3:
            return 'Apr';
          case 4:
            return 'May';
          case 5:
            return 'Jun';
          case 6:
            return 'Ju;';
          case 7:
            return 'Aug';
          case 8:
            return 'Sep';
          case 9:
            return 'Oct';
          case 10:
            return 'Nov';
          case 11:
            return 'Dec';
        }
        return '';
      },
      margin: 20);
}

flSignUpTitle(BuildContext context) {
  return FlTitlesData(
    show: true,
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(
      showTitles: true,
      reservedSize: getDeviceWidth(context) / 100,
      getTitles: (value) {
        return '';
      },
    ),
    leftTitles: _leftTitles(context),
    bottomTitles: _bottomTitles(context),
  );
}

flSignUpGrid(BuildContext context) {
  return FlGridData(
    show: true,
    drawVerticalLine: false,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        color: Pallets.grey100,
        strokeWidth: 2,
      );
    },
  );
}
