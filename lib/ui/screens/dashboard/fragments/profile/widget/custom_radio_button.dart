import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';


class RadioButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final int? defaultID;
  final int? dynamicID;

  RadioButton(
      {required this.onTap,
        required this.title,
        required this.defaultID,
        required this.dynamicID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Pallets.grey200, width: 1.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              dynamicID == defaultID
                  ? Icons.radio_button_on_outlined
                  : Icons.radio_button_off_outlined,
              color: dynamicID == defaultID ? Pallets.amber500 : Pallets.grey200,
            ),
            SizedBox(width: 12),
            TextView(
              text: title!,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey700,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
