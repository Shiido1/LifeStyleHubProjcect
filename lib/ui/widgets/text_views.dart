import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Function()? onTap;

  TextView(
      {required this.text,
      this.textOverflow = TextOverflow.clip,
      this.textAlign = TextAlign.left,
      this.color,
      this.onTap,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            color: color != null ? color : Pallets.grey800,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontStyle: fontStyle),
        textAlign: textAlign,
        overflow: textOverflow,
      ),
    );
  }
}
