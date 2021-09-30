import 'package:flutter/material.dart';

import '../../../../../../helper/helper_handler.dart';
import '../../../../../../utils/pallets.dart';
import '../../../../../widgets/image_loader.dart';
import '../../../../../widgets/text_views.dart';

class PointBreakDownWidget extends StatelessWidget {
  String? packageIcon;
  String? packageName;
  String? packageReward;
  String? packageCheckOutPoint;

  PointBreakDownWidget(
      {this.packageIcon,
      this.packageName,
      this.packageReward,
      this.packageCheckOutPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Pallets.orange50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Pallets.orange500),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: packageIcon!.isEmpty
                  ? Container(
                      height: 35,
                      width: 35,
                    )
                  : ImageLoader(
                      path: packageIcon ?? '',
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
                text: packageName ?? '',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.grey800,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5),
              Container(
                width: getDeviceWidth(context) / 3,
                child: TextView(
                  text: packageReward ?? 'N/A',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Pallets.grey700,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5),
              TextView(
                text: '$packageCheckOutPoint required',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                maxLines: 1,
                color: Pallets.orange500,
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }
}
