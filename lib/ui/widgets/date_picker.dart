import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../helper/helper_handler.dart';

pickDate(
    {@required BuildContext? context,
    @required ValueChanged<String>? onChange}) async {
  final ThemeData theme = Theme.of(context!);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return _buildMaterialDatePicker(context: context, date: onChange);
    case TargetPlatform.macOS:
      return _buildCupertinoDatePicker;
    case TargetPlatform.iOS:
      return _buildCupertinoDatePicker(context: context, date: onChange);
  }
}

/// This builds material date picker in Android
void _buildMaterialDatePicker(
    {@required BuildContext? context, @required var date}) async {
  final DateTime? picked = await showDatePicker(
    context: context!,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(Duration(days: 0)),
    lastDate: DateTime(2025),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light(),
        child: child!,
      );
    },
  );
  if (picked != null && picked != date)
    date(DateFormat('yyyy-MM-dd').format(picked));
}

/// This builds cupertino date picker in iOS
void _buildCupertinoDatePicker(
    {@required BuildContext? context, @required var date}) {
  showModalBottomSheet(
      context: context!,
      builder: (BuildContext builder) {
        return Theme(
            data: ThemeData.light(),
            child: Container(
              height: getDeviceHeight(context) / 3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                backgroundColor: Theme.of(context).cardColor,
                onDateTimeChanged: (picked) {
                  if (picked != date)
                    date(DateFormat('yyyy-MM-dd').format(picked));
                },
                initialDateTime: DateTime.now(),
                minimumYear: 2000,
                maximumYear: 2025,
              ),
            ));
      });
}
