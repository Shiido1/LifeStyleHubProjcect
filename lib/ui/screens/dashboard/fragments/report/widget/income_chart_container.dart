import 'package:flutter/material.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class IncomeChartContainer extends StatelessWidget {
  final String title;
  final Widget chart;

  const IncomeChartContainer({
    Key? key,
    required this.title,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        // padding: EdgeInsets.fromLTRB(0, 10, 20, 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Pallets.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 10),
              child: chart,
            ))
          ],
        ),
      ),
    );
  }
}
