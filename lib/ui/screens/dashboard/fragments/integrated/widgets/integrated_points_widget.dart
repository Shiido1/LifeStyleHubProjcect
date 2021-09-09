import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: getDeviceWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
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
        SizedBox(
          height: 23,
        ),
        Container(
          width: getDeviceWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Pallets.purple50),
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
        )
      ],
    );
  }
}
