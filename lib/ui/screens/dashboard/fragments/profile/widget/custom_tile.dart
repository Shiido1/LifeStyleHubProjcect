import 'package:flutter/material.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class CustomTileWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final String? title;
  final String? titleText;
  final Function()? onTap;
  final bool? visibility;

  CustomTileWidget(
      {this.borderRadius,
      this.title,
      this.onTap,
      this.visibility = true,
      this.titleText});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: titleText ?? '',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Pallets.grey500,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                  borderRadius: borderRadius, color: Pallets.grey100),
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
          ),
        ],
      ),
    );
  }
}
