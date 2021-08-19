import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/widget/ticket_widget.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'open_ticket_screen.dart';
import 'widget/ticket_list_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final _ticketNotifier = ChangeNotifierProvider((ref) => TicketViewmodel());

  TicketViewmodel? _ticketViewmodel;

  @override
  void initState() {
    _ticketViewmodel = context.read(_ticketNotifier);
    _ticketViewmodel!.init(context);
    _ticketViewmodel!.getAllTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _response = watch(_ticketNotifier);
      if (_response.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return LoadingOverlay(
        isLoading: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ButtonWidget(
                width: getDeviceWidth(context),
                buttonText: 'Open a ticket',
                color: Pallets.white,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.normal,
                primary: Pallets.orange600,
                onPressed: () => PageRouter.gotoWidget(OpenTicketScreen(), context),
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketBoxsWidget(
                    number: 3,
                    text: 'Open',
                    color: Pallets.orange50,
                    onTap: () {},
                  ),
                  SizedBox(width: 20),
                  TicketBoxsWidget(
                    number: 3,
                    text: 'Answered',
                    color: Pallets.blue50,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketBoxsWidget(
                    number: 3,
                    text: 'Your reply',
                    color: Pallets.purple50,
                    onTap: () {},
                  ),
                  SizedBox(width: 20),
                  TicketBoxsWidget(
                    number: 3,
                    text: 'Closed',
                    color: Pallets.red50,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: 'Recent tickets',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  TextView(
                    onTap: (){},
                    text: 'View All',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey800,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 17),
              ..._response.data!
                  .map((element) => TicketListWidget(element))
                  .toList(),
              SizedBox(height: 33),
            ],
          ),
        ),
      );
    });
  }
}
