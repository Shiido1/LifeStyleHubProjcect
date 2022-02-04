import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/open_message_model.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class SenderText extends StatelessWidget {
  final Data? message;
  SenderText(this.message, {Key? key}) : super(key: key);
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(top: 16, bottom: 16, left: 120),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Pallets.orange50),
              child: Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4),
                child: Html(data: message!.body!, style: {
                  "table": Style(
                    backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  ),
                  "tr": Style(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  "th": Style(
                    padding: EdgeInsets.all(6),
                    backgroundColor: Colors.grey,
                  ),
                  "td": Style(
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.topLeft,
                  ),
                  'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                }),
                //  TextView(
                //   text: _parseHtmlString(message!.body!).toString(),
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   color: Pallets.grey600,
                //   textAlign: TextAlign.right,
                // ),
              )),
          TextView(
            text: fomartTime(now.toString()),
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
