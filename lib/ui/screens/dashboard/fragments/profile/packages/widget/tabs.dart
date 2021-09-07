import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class Tabs extends StatelessWidget {
  final String? title;
  final int? defaultID;
  final int? dynamicID;
  final Function()? onTap;

  Tabs({this.title, this.defaultID, this.dynamicID, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: dynamicID == defaultID
                  ? Pallets.orange500
                  : Pallets.orange50),
          child: TextView(
            text: title!,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: dynamicID == defaultID ? Pallets.white : Pallets.grey600,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
