import 'package:flutter/material.dart';
import '../../helper/helper_handler.dart';
import '../../helper/routes/navigation.dart';
import '../../utils/pallets.dart';

import 'text_views.dart';

void showGeneralSheet(BuildContext context, String title, List items,
    {Function(String value)? onPress}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: getDeviceHeight(context) / 2.5,
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Pallets.white),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: getDeviceWidth(context) / 4,
                  child: Divider(thickness: 3)),
              SizedBox(height: 27),
              Center(
                child: TextView(
                  text: title,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Pallets.grey700,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 41),
              ...items
                  .map(
                    (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextView(
                          text: e,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Pallets.grey700,
                          textAlign: TextAlign.left,
                        ),
                        onTap: () {
                          onPress!(e);
                        }),
                  )
                  .toList(),
            ]),
          ),
        );
      });
}
