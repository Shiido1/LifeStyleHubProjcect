import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/helper_handler.dart';
import '../../utils/pallets.dart';

void showCustomDialog(BuildContext context,
    {String? title,
    required List<String> items,
    required Function(String value)? onTap}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title,
          items: items,
          onTap: onTap,
        );
      });
}

// ignore: must_be_immutable
class CustomDialogBox extends StatelessWidget {
  final String? title;
  final List<String> items;
  var onTap;

  CustomDialogBox(
      {Key? key, this.title, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title ?? '',
              style: TextStyle(
                  fontSize: 18,
                  color: Pallets.grey800,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 16,
            ),
            ...items.map((item) => Container(
                  width: getDeviceWidth(context),
                  child: CupertinoButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                      child: Text(
                        item,
                        style: TextStyle(
                            fontSize: 18,
                            color: Pallets.grey700,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () {
                        onTap!(item);
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
