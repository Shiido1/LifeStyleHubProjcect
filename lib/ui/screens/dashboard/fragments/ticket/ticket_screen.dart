import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';

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
      if(_response.myTicketModel!.data!.isEmpty){
        return Center(
          child: Text('Empty'),
        );
      }
      return LoadingOverlay(
        isLoading: _response.loading,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      );
    });
  }
}
