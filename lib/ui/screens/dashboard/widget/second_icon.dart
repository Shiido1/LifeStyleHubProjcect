import 'package:flutter/material.dart';
import '../../../widgets/text_views.dart';
import '../../../../utils/pallets.dart';

import 'first_icons.dart';

class SecondIcon extends StatelessWidget {
  final String? icon;
  final String? text;
  final String? money;
  final Color? mainBgColor;
  final Color? smallBgColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const SecondIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.money,
      required this.mainBgColor,
      required this.textColor,
      required this.smallBgColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mainBgColor, borderRadius: BorderRadius.circular(19)),
      padding: EdgeInsets.only(top: 32, left: 32, bottom: 32, right: 42.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstIcons(
            icon: icon,
            bgColor: smallBgColor,
          ),
          SizedBox(
            height: 32,
          ),
          TextView(
            text: text!,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: textColor,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          TextView(
            text: money!,
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Pallets.grey700,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 16,
          ),
          TextView(
            onTap: onTap,
            text: 'View all',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Pallets.grey600,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
