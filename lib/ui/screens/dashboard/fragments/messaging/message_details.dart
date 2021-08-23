import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/database/users_data_provider.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/dao/messaging_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/get_last_messages_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart'
    as open;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/widget/sender_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/viewmodel/ticket_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/widget/chat_text_box.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'viewmodel/messaging_viewmodel.dart';
import 'widget/receiver_widget.dart';

class MessageDetailsSms extends StatefulWidget {
  final Conversation? conversation;

  const MessageDetailsSms({Key? key, required this.conversation})
      : super(key: key);

  @override
  _MessageDetailsSmsState createState() =>
      _MessageDetailsSmsState(conversation);
}

class _MessageDetailsSmsState extends State<MessageDetailsSms> {
  final Conversation? conversation;

  _MessageDetailsSmsState(this.conversation);

  final _messageViewModel =
      ChangeNotifierProvider((ref) => MessagingViewmodel());

  MessagingViewmodel? _messagingViewmodel;

  final _userModelProvider =
      ChangeNotifierProvider((ref) => UsersInfoViewModel());

  @override
  void initState() {
    _messagingViewmodel = context.read(_messageViewModel);
    context.read(_userModelProvider).getUsersData();
    _messagingViewmodel!.init(context);
    _messagingViewmodel!.openMessage(conversation!.id.toString());
    _currentItemSelected = _dropdownValues.first;
    super.initState();
  }

  final List<String> _dropdownValues = ["Today", "Yesterday"];
  String? _currentItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Messages',
          showLeadig: true,
          showImage: false,
          showMoreMenu: true,
          centerTitle: true,
          onTap: () => null),
      body: FutureBuilder(
        future: messageDao!.getChat(conversation!.id.toString()),
        builder: (context, AsyncSnapshot<open.OpenMessageModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<open.Data> _messages = snapshot.data!.data!.reversed.toList();

          return Consumer(builder: (context, watch, child) {
            final _userData = watch(_userModelProvider);
            return Stack(
              children: [
                LoadingOverlay(
                  isLoading: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                        ..._messages.map((message) {
                          if (message.sender?.id == _userData.user.id) {
                            return SenderText(message);
                          }
                          return ReceiversText(message);
                        }).toList(),
                      ],
                    ),
                  ),
                ),
                ChatEditText()
              ],
            );
          });
        },
      ),
    );
  }
}
