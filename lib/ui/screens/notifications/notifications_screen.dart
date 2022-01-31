import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'viewmodel/notification_viewmodel.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationViewmodel? _notificationViewmodel;
  @override
  void initState() {
    _notificationViewmodel =
        Provider.of<NotificationViewmodel>(context, listen: false);
    _notificationViewmodel!.init(context);
    _notificationViewmodel!.notification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Notification',
          showLeadig: true,
          showImage: false,
          centerTitle: true,
          onTap: () => null),
      body: SafeArea(
        child: Stack(
          children: [
            Consumer<NotificationViewmodel>(
              builder: (context, notification, child) {
                if (notification.notificationList.isEmpty) {
                  return Center(
                    child: TextView(
                      text: 'No Notification',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Pallets.orange500,
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      ...notification.notificationList
                          .map((notification) => Container(
                                padding: EdgeInsets.all(8.w),
                                margin: EdgeInsets.all(8.w),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: notification.text ?? '',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Pallets.grey600,
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 4),
                                    TextView(
                                      text: fomartDate(notification.date ?? ''),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Pallets.grey400,
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ))
                    ],
                  ),
                );
              },
            ),
            ButtomCountDownWidget()
          ],
        ),
      ),
    );
  }
}
