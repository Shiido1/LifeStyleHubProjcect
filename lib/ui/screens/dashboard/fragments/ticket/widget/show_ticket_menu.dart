import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../model/my_ticket_model.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';

void showOpenedTicketMenuModal(BuildContext context, Data? element) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: getDeviceHeight(context) / 2.5,
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Pallets.white),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: getDeviceWidth(context) / 4,
                  child: Divider(thickness: 3)),
              SizedBox(height: 23),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: TextView(
                        text: 'Ticket number',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: TextView(
                        text: element!.ticketId ?? 'N/A',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Pallets.grey600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: TextView(
                        text: 'Department',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: TextView(
                        text: element.department ?? 'N/A',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Pallets.grey600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: TextView(
                        text: 'Priority',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: TextView(
                        text: element.priority ?? 'N/A',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Pallets.red500,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: TextView(
                        text: 'Status of ticket',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallets.grey400,
                        textAlign: TextAlign.left,
                      ),
                      subtitle: TextView(
                        text: element.status ?? 'N/A',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Pallets.grey600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: TextView(
                  text: 'Last updated',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey400,
                  textAlign: TextAlign.left,
                ),
                subtitle: TextView(
                  text: fomartDate(element.updatedAt!),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 23),
              ButtonWidget(
                width: getDeviceWidth(context),
                buttonText: 'Close this ticket',
                color: Pallets.white,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                primary: Pallets.red600,
                onPressed: () => PageRouter.goBack(context),
              ),
              SizedBox(height: 23),
            ]),
          ),
        );
      });
}
