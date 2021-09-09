import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class TicketBoxsWidget extends StatelessWidget {
  final int? number;
  final String? text;
  final VoidCallback? onTap;
  final Color? color;

  const TicketBoxsWidget(
      {Key? key,
      required this.number,
      required this.text,
      required this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: getDeviceWidth(context),
          padding: EdgeInsets.symmetric(vertical: 43),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: '$number',
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Pallets.black,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextView(
                text: text!,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Pallets.grey600,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
