import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class MultiColorWidget extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  final String? package;
  final String? points;
  final String? date;

  const MultiColorWidget(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.package,
      required this.points,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(23),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextView(
                  text: title ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: TextView(
                  text: points ?? '',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextView(
                  text: package ?? '',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: TextView(
                  text: date ?? '',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Pallets.grey500,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
