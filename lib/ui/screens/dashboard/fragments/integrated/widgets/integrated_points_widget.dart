import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class IntegratedPointAndCommissionWidget extends StatelessWidget {
  final String? total;
  final String? claimed;
  final String? totalPoint;
  final String? totalClaimed;

  const IntegratedPointAndCommissionWidget({
    Key? key,
    required this.total,
    required this.claimed,
    required this.totalPoint,
    required this.totalClaimed,
  }) : super(key: key);

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
                  text: '$totalPoint',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.grey700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextView(
                  text: total ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
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
                  text: '$totalClaimed',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Pallets.grey700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                TextView(
                  text: claimed ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
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
