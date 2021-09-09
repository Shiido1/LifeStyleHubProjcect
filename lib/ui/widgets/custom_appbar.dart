import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/routes/navigation.dart';
import '../../utils/pallets.dart';

import 'image_loader.dart';
import 'text_views.dart';

AppBar getCustomAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeadig = false,
    bool showLeadingWidget = true,
    bool changeLeadingIcon = false,
    bool showImage = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation = .0,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeadig,
    elevation: elevation,
    centerTitle: centerTitle,
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
      Visibility(
        visible: showImage,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: ImageLoader(
              isCircular: true,
              radius: 20,
              path: image,
              onTap: onTap,
            ),
          ),
        ),
      ),
      Visibility(
          visible: showMoreMenu,
          child: IconButton(
              onPressed: onTap, icon: Icon(Icons.more_vert_outlined)))
    ],
  );
}
