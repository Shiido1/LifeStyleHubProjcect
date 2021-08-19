import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/bottom_count_down.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';

import 'widget/ticket_list_widget.dart';

class ViewMoreTicketsScreen extends StatefulWidget {
  const ViewMoreTicketsScreen({Key? key}) : super(key: key);

  @override
  _ViewMoreTicketsScreenState createState() => _ViewMoreTicketsScreenState();
}

class _ViewMoreTicketsScreenState extends State<ViewMoreTicketsScreen> {
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
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Ticket details',
          showLeadig: true,
          image: 'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
          showImage: true,
          showMoreMenu: false,
          centerTitle: true,
          onTap: () {}),
      body: Consumer(builder: (context, watch, child) {
        final _response = watch(_ticketNotifier);
        if (_response.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return LoadingOverlay(
          isLoading: false,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    SizedBox(height: 32),
                    ..._response.myTicketModel!.data!
                        .map((element) => TicketListWidget(element))
                        .toList(),
                    SizedBox(height: 33),
                  ],
                ),
              ),
              ButtomCountDownWidget()
            ],
          ),
        );
      }),
    );
  }
}
