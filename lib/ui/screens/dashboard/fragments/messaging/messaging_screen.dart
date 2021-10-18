import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../helper/routes/navigation.dart';
import '../../../../../utils/pallets.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/text_views.dart';
import '../ticket/widget/filter_modal.dart';
import 'create_message.dart';
import 'dao/messaging_dao.dart';
import 'enum/message_enum.dart';
import 'message_details.dart';
import 'model/get_last_messages_model.dart';
import 'viewmodel/messaging_viewmodel.dart';

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

  @override
  void initState() {
    _messagingViewmodel = context.read(_messageViewModel);
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

    _getProfileData();
    super.initState();
  }

  final TextEditingController _textEditingController = TextEditingController();

  UsersProfileModel? _usersProfileModel;

  void _getProfileData() async {
    _usersProfileModel = await profileDao!.convert();
    setState(() {});
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
          margin: EdgeInsets.only(bottom: 70),
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
              if (_provider.loading) {
                return Center(
                  child: SpinKitCubeGrid(
                    color: Pallets.orange600,
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: SmartRefresher(
                  controller: _provider.lastMessageController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () =>
                      _messagingViewmodel!.getLastMessage(isRefreshing: true),
                  onLoading: () => _messagingViewmodel!
                      .loadLastPagination(_textEditingController.text),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: EditFormField(
                              label: 'Search messages',
                              controller: _textEditingController,
                              keyboardType: TextInputType.text,
                              suffixIcon: Icons.search,
                              suffixIconColor: Pallets.orange600,
                              textInputAction: TextInputAction.search,
                              onPasswordToggle: () {
                                _messagingViewmodel!.getLastMessage(
                                    search: _textEditingController.text,
                                    isRefreshing: true);
                              },
                              onSaved: (value) {
                                _messagingViewmodel!.getLastMessage(
                                    search: value, isRefreshing: true);
                              },
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          // Container(
                          //   height: 48,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(8),
                          //       color: Pallets.orange500),
                          //   child: Center(
                          //       child: ImageLoader(
                          //           onTap: () => showTicketFiltering(context,
                          //               callBack: (filter) {}),
                          //           path: 'assets/svgs/filter.svg')),
                          // )
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
                                    text: _formatReceiver(elements.conversation,
                                            _usersProfileModel!) ??
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
                ),
              );
            });
          },
        ));
  }

  String? _formatReceiver(Conversation? conversation, UsersProfileModel user) {
    String? _receiver = 'Guest';
    conversation!.participants!.map((participant) {
      if (participant.messageable?.id != user.id)
        _receiver = participant.messageable?.name;
      else
        _receiver = 'Guest';
    }).toList();
    return _receiver ?? 'Guest';
  }
}
