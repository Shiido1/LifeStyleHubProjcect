import 'package:flutter/material.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class Tabs extends StatelessWidget {
  final String? text;
  final bool isSelected;
  final Function()? onTap;

  Tabs({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Pallets.orange50 : Colors.transparent,
            borderRadius: BorderRadius.circular(19)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextView(
          text: text!,
          fontSize: 14,
          textAlign: TextAlign.center,
          color: Pallets.grey700,
        ),
      ),
    );
  }
}
