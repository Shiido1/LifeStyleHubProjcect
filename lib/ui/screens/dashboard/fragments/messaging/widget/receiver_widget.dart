import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class ReceiversText extends StatelessWidget {
  final Data? message;
  const ReceiversText(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Pallets.grey100),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextView(
                  text: '${message!.body ?? ''}',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Pallets.grey600,
                  textAlign: TextAlign.left,
                ),
              )),
          TextView(
            text: fomartTime(message!.createdAt!),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Pallets.grey400,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}