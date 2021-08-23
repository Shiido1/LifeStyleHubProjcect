import 'package:flutter/material.dart';
import 'package:lifestyle_hub/database/users_data_provider.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/dao/messaging_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/get_last_messages_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart'
    as open;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/repository/messaging_repository.dart';

MessageRepository _messageRepository = MessageRepository();

class MessagingViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  List<Data>? _getLastMessages;

  List<Data>? get getLastMessages => _getLastMessages;

  /// initialize auth viewmodel
  void init(BuildContext context) {
    this._context = context;
  }

  /// show loading indicator
  void _showLoading({bool notify = false}) {
    _loading = true;
    if (notify) notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  ///[Mock] sort video contents
  void sortContentById(List<Data>? data, [UsersInfoViewModel? user]) {
    _getLastMessages = data!
        .where((element) =>
            element.conversation!.lastMessage!.sender!.id != user!.user.id)
        .toList();
  }

  /// get last messages
  Future<void> getLastMessage() async {
    try {
      if (messageDao!.box!.isEmpty) _showLoading();
      final _response = await _messageRepository.getLastMessages();
      messageDao!.saveContents(_response.data);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// open last messages
  Future<void> openMessage(String id) async {
    try {
      _showLoading();
      final _response =
          await _messageRepository.openMessage({'conversation_id': id});
      messageDao!.saveChat(id, _response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// open last messages
  Future<void> sendMessage(String id, String message) async {
    try {
      _showLoading();
      await _messageRepository
          .sendMessage({'conversation_id': id, 'message': message});
      openMessage(id);
      getLastMessage();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  List<open.Data> openedMessage = [];

  /// get cached messages
  Future<void> getCachedMessage(String id) async {
    open.OpenMessageModel _model = await messageDao!.getChat(id);
    openedMessage = _model.data!;
    notifyListeners();
  }
}
