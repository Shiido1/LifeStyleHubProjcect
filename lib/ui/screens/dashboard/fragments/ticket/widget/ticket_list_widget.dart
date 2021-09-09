import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../model/my_ticket_model.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

import '../ticket_sms.dart';

class TicketListWidget extends StatelessWidget {
  final Data? element;

  const TicketListWidget(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () =>
          PageRouter.gotoWidget(TicketDetailsSms(element: element), context),
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _getBackgroundStatusColor(element!.status!)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextView(
                    text: element!.subject!,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _getStatusColor(element!.status!)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Center(
                        child: TextView(
                          text: element!.status!,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Pallets.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: 18),
            TextView(
              text: element!.message!,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Pallets.grey500,
              textAlign: TextAlign.left,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextView(
                    text: element!.department ?? 'N/A',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: TextView(
                      text: fomartDate(element!.updatedAt!),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Pallets.grey700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundStatusColor(String s) {
    if (s.toLowerCase() == 'open') return Pallets.green50;

    if (s.toLowerCase() == 'answered') return Pallets.amber50;

    if (s.toLowerCase() == 'closed') return Pallets.red50;

    return Pallets.grey400;
  }

  Color _getStatusColor(String s) {
    if (s.toLowerCase() == 'open') return Pallets.green500;

    if (s.toLowerCase() == 'answered') return Pallets.amber500;

    if (s.toLowerCase() == 'closed') return Pallets.red500;

    return Pallets.grey400;
  }
}
