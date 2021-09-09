import 'package:flutter/material.dart';
import 'text_views.dart';
import '../../utils/pallets.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? primary;
  final Color? borderColor;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;

  ButtonWidget(
      {required this.buttonText,
      required this.onPressed,
      this.textOverflow = TextOverflow.clip,
      this.textAlign = TextAlign.left,
      this.color,
      this.borderColor,
      this.height = 48.0,
      this.width = 100.0,
      this.fontSize = 14.0,
      this.radius = 5.0,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: primary != null ? primary : Pallets.orange600,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!)),
            side: BorderSide(
                color: borderColor != null ? borderColor! : Pallets.orange600)),
        onPressed: onPressed,
        child: TextView(
          text: buttonText,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
