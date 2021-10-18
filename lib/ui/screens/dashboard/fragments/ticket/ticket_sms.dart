import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'viewmodel/ticket_viewmodel.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/overlay.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

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
  String? _currentItemSelected;

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            color: Pallets.grey100,
                            borderRadius: BorderRadius.circular(30)),
                        child: PopupMenuButton<String>(
                          itemBuilder: (context) {
                            return _dropdownValues.map((str) {
                              return PopupMenuItem(
                                value: str,
                                child: Text(str),
                              );
                            }).toList();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(_currentItemSelected!),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          onSelected: (v) {
                            setState(() {
                              _currentItemSelected = v;
                            });
                          },
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
