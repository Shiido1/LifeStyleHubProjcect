import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'image_loader.dart';
import 'text_views.dart';

AppBar getCustomAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeadig = false,
    bool showLeadingWidget = true,
    double? elevation = .0,
    String image = '',
    VoidCallback? onBurgerTapped}) {
  return AppBar(
    automaticallyImplyLeading: showLeadig,
    elevation: elevation,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: showLeadingWidget
        ? IconButton(
            color: Pallets.black,
            onPressed: onBurgerTapped,
            icon: Icon(Icons.menu))
        : null,
    title: TextView(
      text: title,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Pallets.grey700,
      textAlign: TextAlign.left,
    ),
    actions: [
      Center(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: ImageLoader(
            isCircular: true,
            radius: 20,
            path: image,
            onTap: onTap,
          ),
        ),
      )
    ],
  );
}
