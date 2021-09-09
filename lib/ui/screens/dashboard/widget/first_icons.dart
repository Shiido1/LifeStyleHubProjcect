import 'package:flutter/material.dart';
import '../../../widgets/image_loader.dart';

class FirstIcons extends StatelessWidget {
  final String? icon;
  final Color? bgColor;

  FirstIcons({required this.bgColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      width: 61,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: ImageLoader(
        path: icon,
      ),
    );
  }
}
