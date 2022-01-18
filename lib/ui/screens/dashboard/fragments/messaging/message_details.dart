import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/sender_widget.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../ticket/widget/chat_text_box.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/overlay.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'model/get_last_messages_model.dart';
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

  final TextEditingController _controller = TextEditingController();
  UsersProfileModel? _usersProfileModel;

  @override
  void initState() {
    _messagingViewmodel = context.read(_messageViewModel);
    _messagingViewmodel!.init(context);
    _messagingViewmodel!.openMessage(conversation!.id.toString());
    _currentItemSelected = _dropdownValues.first;
    _getProfileData();
    super.initState();
  }

  final List<String> _dropdownValues = ["Today", "Yesterday"];
  String? _currentItemSelected;
  ScrollController _scrollController = new ScrollController();

  void _getProfileData() async {
    _usersProfileModel = await profileDao!.convert();
    setState(() {});
  }

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
      body: Consumer(builder: (context, watch, child) {
        final _cachedMessage = watch(_messageViewModel);
        _cachedMessage.getCachedMessage(conversation!.id.toString());

        return Stack(
          children: [
            LoadingOverlay(
              isLoading: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  controller: _scrollController,
                  reverse: false,
                  children: [
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
                    ..._cachedMessage.openedMessage.map((message) {
                      if (message.sender?.id == _usersProfileModel!.id) {
                        return SenderText(message);
                      }
                      return ReceiversText(message);
                    }).toList(),
                    Padding(padding: EdgeInsets.only(bottom: 50.w)),
                    SizedBox(
                      height: 23,
                    )
                  ],
                ),
              ),
            ),
            ChatEditText(
              controller: _controller,
              onSubmit: (v) => _sendMessage(v),
            )
          ],
        );
      }),
    );
  }

  Future<void> _sendMessage(String? v) async {
    if (v!.isEmpty) {
      return;
    }
    await _messagingViewmodel!.sendMessage(conversation!.id.toString(), v);
    _controller.text = '';
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    setState(() {});
  }
}
