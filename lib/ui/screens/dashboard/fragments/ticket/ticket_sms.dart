import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'model/my_ticket_model.dart';
import 'widget/chat_text_box.dart';
import 'widget/show_ticket_menu.dart';

class TicketDetailsSms extends StatefulWidget {
  final Data? element;

  const TicketDetailsSms({Key? key, required this.element}) : super(key: key);

  @override
  _TicketDetailsSmsState createState() => _TicketDetailsSmsState(element);
}

class _TicketDetailsSmsState extends State<TicketDetailsSms> {
  final _ticketNotifier = ChangeNotifierProvider((ref) => TicketViewmodel());
  final Data? element;

  TicketViewmodel? _ticketViewmodel;

  _TicketDetailsSmsState(this.element);

  @override
  void initState() {
    _ticketViewmodel = context.read(_ticketNotifier);
    _ticketViewmodel!.init(context);
    super.initState();
  }

  final List<String> _dropdownValues = ["Today", "Yesterday"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Ticket details',
          showLeadig: true,
          showImage: false,
          showMoreMenu: true,
          centerTitle: true,
          onTap: () => showOpenedTicketMenuModal(context, element)),
      body: Consumer(builder: (context, watch, child) {
        final _response = watch(_ticketNotifier);

        return Stack(
          children: [
            LoadingOverlay(
              isLoading: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Pallets.orange50),
                      child: ImageLoader(path: 'assets/svgs/headset.svg'),
                    ),
                    SizedBox(height: 16),
                    TextView(
                      text: element!.department ?? 'N/A',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Pallets.grey800,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    TextView(
                      text:
                          'This is the very begining of your conversation\nwith Sales department',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Pallets.grey600,
                      textAlign: TextAlign.center,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Pallets.grey200,
                          border: Border.all(
                              color: Pallets.grey200,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButton(
                          underline: Container(),
                          items: _dropdownValues
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (String? value) {},
                          isExpanded: false,
                          value: _dropdownValues.first,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ChatEditText(
              onSubmit: (v) {},
            )
          ],
        );
      }),
    );
  }
}
