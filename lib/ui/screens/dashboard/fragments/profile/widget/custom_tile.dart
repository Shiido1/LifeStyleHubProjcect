import 'package:flutter/material.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class CustomTileWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final String? title;
  final Function()? onTap;

  CustomTileWidget({this.borderRadius, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration:
            BoxDecoration(borderRadius: borderRadius, color: Pallets.grey100),
        child: Row(
          children: [
            Expanded(
              child: TextView(
                text: title!,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Pallets.black,
                textAlign: TextAlign.left,
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
