import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

// ignore: must_be_immutable
class ActivePackageWidget extends StatelessWidget {
  final String? title;
  int? percent;

  ActivePackageWidget({Key? key, required this.title, required this.percent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context) / 1.5,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Pallets.grey700),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: title!,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Pallets.white,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: '$percent%',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Pallets.white,
                textAlign: TextAlign.left,
              ),
              Icon(
                Icons.home_outlined,
                color: Pallets.white,
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          LinearProgressIndicator(
            backgroundColor: Pallets.grey600,
            valueColor: new AlwaysStoppedAnimation<Color>(Pallets.orange500),
            value: percent! / 100,
          ),
          SizedBox(
            height: 10,
          ),
          TextView(
            text: 'Extra Luxury',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Pallets.white,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
