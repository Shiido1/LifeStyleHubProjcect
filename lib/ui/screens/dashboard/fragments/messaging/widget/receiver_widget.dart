import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/open_message_model.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';
import 'package:html/parser.dart';

class ReceiversText extends StatelessWidget {
  final Data? message;
  const ReceiversText(this.message, {Key? key}) : super(key: key);

//here goes the function 
String? _parseHtmlString(String htmlString) {
final document = parse(htmlString);
final String? parsedString = parse(document.body?.text).documentElement?.text;

return parsedString;
}

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
                  text: _parseHtmlString(message!.body!).toString(),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Pallets.grey600,
                  textAlign: TextAlign.left,
                ),
              )),
          TextView(
            text: fomartTime(DateTime.now().toString()),
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
