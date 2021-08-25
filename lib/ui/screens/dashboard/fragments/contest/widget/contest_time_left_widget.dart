import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class ContestTimeLeftWidget extends StatelessWidget {
  final String? timeLeft;
  final int? directs;

  const ContestTimeLeftWidget(
      {Key? key, required this.timeLeft, required this.directs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Pallets.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextView(
                text: '${directs ?? 0}',
                color: Pallets.black,
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
            color: Pallets.white,
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
