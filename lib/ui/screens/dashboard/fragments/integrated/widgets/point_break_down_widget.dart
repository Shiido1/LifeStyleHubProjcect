import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class PointBreakDownWidget extends StatelessWidget {
  const PointBreakDownWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Pallets.orange50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Pallets.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/svgs/crown.svg',
                height: 35,
                width: 35,
              ),
            ),
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextView(
                text: 'Solid Refuge',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.grey800,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5),
              TextView(
                text: '3 bredroom apartment',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Pallets.grey700,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5),
              TextView(
                text: '55 required',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                maxLines: 1,
                color: Pallets.red600,
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
