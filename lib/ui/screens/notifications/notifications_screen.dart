import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(height: 36),
                  TextView(
                    text: 'Clear all',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Pallets.orange500,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            ButtomCountDownWidget()
          ],
        ),
      ),
    );
  }
}
