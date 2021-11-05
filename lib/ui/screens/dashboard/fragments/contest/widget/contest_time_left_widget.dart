import 'package:flutter/material.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class ContestTimeLeftWidget extends StatelessWidget {
  final String? timeLeft;
  final int? directs;
  final Color? bgColor;
  final Color? textColor;
  final Color? timeColor;
  final double? height;
  final double? width;

  ContestTimeLeftWidget(
      {this.height,
      this.width,
      this.timeLeft,
      this.directs,
      this.bgColor,
      this.textColor,
      this.timeColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: bgColor != null ? bgColor : Pallets.white,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextView(
                text: directs!.isNegative?'00:':'${directs ?? 0}',
                color: textColor != null ? textColor : Pallets.black,
                fontSize: 24,
                textAlign: TextAlign.center,
                maxLines: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextView(
            text: timeLeft ?? '',
            color: timeColor != null ? timeColor : Pallets.white,
            fontSize: 16,
            textAlign: TextAlign.center,
            maxLines: 1,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
