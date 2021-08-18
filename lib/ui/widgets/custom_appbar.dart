import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'image_loader.dart';
import 'text_views.dart';

AppBar getCustomAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeadig = false,
    bool showLeadingWidget = true,
    bool changeLeadingIcon = false,
    double? elevation = .0,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeadig,
    elevation: elevation,
    leading: changeLeadingIcon
        ? IconButton(
            onPressed: () => PageRouter.goBack(context),
            icon: Platform.isIOS
                ? Icon(Icons.navigate_before)
                : Icon(Icons.keyboard_arrow_left))
        : null,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
