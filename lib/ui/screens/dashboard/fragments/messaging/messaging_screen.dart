import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/database/users_data_provider.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/create_message.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/dao/messaging_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/enum/message_enum.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/viewmodel/messaging_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/widget/filter_modal.dart';
import 'package:lifestyle_hub/ui/widgets/edit_form_widget.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'message_details.dart';
import 'model/get_last_messages_model.dart';

class MessagingScreen extends StatefulWidget {
  MessagingScreen({Key? key}) : super(key: key);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  AnimationController? _animationController;
  Animation<Color?>? _buttonColor;
  Animation<double>? _animateIcon;
  Animation<double>? _translationButton;
  Curve _curve = Curves.easeInOut;
  double _fabHeight = 56.0;

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
    _messagingViewmodel!.getLastMessage();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);

    _buttonColor = ColorTween(begin: Pallets.orange600, end: Pallets.orange600)
        .animate(CurvedAnimation(
      parent: _animationController!,
      curve: Interval(0.00, 1.00, curve: Curves.linear),
    ));

    _translationButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController!,
            curve: Interval(0.0, 0.75, curve: _curve)));

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  animate() {
    if (!_isOpen) {
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
    _isOpen = !_isOpen;
  }

  FloatingActionButton chat() {
    return FloatingActionButton(
      backgroundColor: Pallets.grey100,
      heroTag: 'one',
      elevation: 2,
      onPressed: () => PageRouter.gotoWidget(
          CreateMessageScreen(messageEnum: MessageEnum.single), context),
      child: ImageLoader(
        path: 'assets/svgs/chat_dot.svg',
        dColor: Pallets.grey700,
      ),
    );
  }

  FloatingActionButton speaker() {
    return FloatingActionButton(
      backgroundColor: Pallets.grey100,
      heroTag: 'two',
      elevation: 2,
      onPressed: () => PageRouter.gotoWidget(
          CreateMessageScreen(messageEnum: MessageEnum.broadcast), context),
      child: ImageLoader(
          path: 'assets/svgs/mic_speaker.svg', dColor: Pallets.grey700),
    );
  }

  FloatingActionButton toggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor!.value,
      onPressed: animate,
      child:
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animateIcon!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 90),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform(
                transform: Matrix4.translationValues(
                    0.0, _translationButton!.value * 2.0, 0.0),
                child: chat(),
              ),
              Transform(
                transform: Matrix4.translationValues(
                    0.0, _translationButton!.value, 0.0),
                child: speaker(),
              ),
              toggle()
            ],
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: messageDao!.getListenable()!,
          builder: (context, Box<dynamic> box, __) {
            List<Data> _messageList = messageDao!.convert(box).toList();
            return Consumer(builder: (context, watch, __) {
              final _provider = watch(_messageViewModel);
              final _user = watch(_userModelProvider);
              if (_provider.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 7,
                          child: EditFormField(
                            label: 'Search tickets',
                            controller: null,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Pallets.orange500),
                            child: Center(
                                child: ImageLoader(
                                    onTap: () => showTicketFiltering(context,
                                        callBack: (filter) {}),
                                    path: 'assets/svgs/filter.svg')),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32),
                    Column(
                      children: _messageList
                          .map((elements) => ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                onTap: () => PageRouter.gotoWidget(
                                    MessageDetailsSms(
                                        conversation: elements.conversation),
                                    context),
                                leading: CircleAvatar(
                                  backgroundColor: Pallets.amber500,
                                  child: TextView(
                                      text: '',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                title: TextView(
                                  text: _formatReceiver(
                                          elements.conversation, _user) ??
                                      '',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Pallets.grey700,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                subtitle: TextView(
                                  text: elements
                                          .conversation?.lastMessage?.body ??
                                      '',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.grey400,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 36),
                  ],
                ),
              );
            });
          },
        ));
  }

  String? _formatReceiver(Conversation? conversation, UsersInfoViewModel user) {
    String? _receiver = 'Guest';
    conversation!.participants!.map((participant) {
      if (participant.messageable?.id != user.user.id)
        _receiver = participant.messageable?.name;
      else
        _receiver = 'Guest';
    }).toList();
    return _receiver ?? 'Guest';
  }
}
