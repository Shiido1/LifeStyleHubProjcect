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
            return 'J';
          case 1:
            return 'F';
          case 2:
            return 'M';
          case 3:
            return 'A';
          case 4:
            return 'M';
          case 5:
            return 'J';
          case 6:
            return 'J';
          case 7:
            return 'A';
          case 8:
            return 'S';
          case 9:
            return 'O';
          case 10:
            return 'N';
          case 11:
            return 'D';
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
