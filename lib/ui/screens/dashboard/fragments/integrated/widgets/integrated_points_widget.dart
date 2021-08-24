import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class IntegratedPointWidget extends StatelessWidget {
  const IntegratedPointWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: getDeviceWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 34, vertical: 68),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Pallets.blue50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: '150',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.grey700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextView(
                  text: 'Total incomes',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: Container(
            width: getDeviceWidth(context),
            padding: EdgeInsets.symmetric(horizontal: 34, vertical: 68),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Pallets.purple50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextView(
                  text: '150',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.grey700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextView(
                  text: 'Withdraws',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
