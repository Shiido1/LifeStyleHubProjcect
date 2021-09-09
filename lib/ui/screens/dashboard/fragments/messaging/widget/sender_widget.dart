import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/open_message_model.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

class SenderText extends StatelessWidget {
  final Data? message;
  const SenderText(this.message, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Pallets.orange50),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextView(
                  text: '${message!.body ?? ''}',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Pallets.grey600,
                  textAlign: TextAlign.right,
                ),
              )),
          TextView(
            text: fomartTime(message!.createdAt!),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Pallets.grey400,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}
