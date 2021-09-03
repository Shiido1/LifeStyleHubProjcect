import 'package:flutter/cupertino.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.height;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}

double? getDeviceSizes(BuildContext context, MediaQueryData mediaQuery) {
  double deviceSize = mediaQuery.size.height;
}
