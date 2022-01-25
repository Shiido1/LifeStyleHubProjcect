import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class AnalyticsModel {
  final Color? color;
  final String? textName;
  final int? textSignup;
  final int? textClick;
  AnalyticsModel({
    this.color,
    this.textName,
    this.textSignup,
    this.textClick,
  });
}

class AnalyticalGraph extends StatelessWidget {
  const AnalyticalGraph({
    Key? key,
    this.element,
  }) : super(key: key);
  final AnalyticsModel? element;

  calculatePercentage(int? signUp) {
    logger.d('print number $signUp');
    int? total;
    if (element!.textName == "Total") total = element!.textSignup!;
    logger.d('logging total $total');
    double? value = signUp! / total! * 100;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: TextView(
              text: element!.textName ?? "N/A",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Pallets.dark,
            ),
          ),

          Expanded(
            child: TextView(
              text: element!.textSignup!.toString(),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Pallets.grey400,
            ),
          ),
          // TextView(
          //   text: calculatePercentage(element?.textSignup).toString(),
          //   fontSize: 13,
          //   fontWeight: FontWeight.w500,
          //   color: Pallets.grey400,
          // ),
          Expanded(
            child: TextView(
              text: element!.textClick!.toString(),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Pallets.grey400,
            ),
          )
        ],
      ),
    );
  }
}
