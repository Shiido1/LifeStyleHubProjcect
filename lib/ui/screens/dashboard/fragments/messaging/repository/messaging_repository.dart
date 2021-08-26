import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/create_message_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/get_last_messages_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/send_message_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class MessageRepository {
  Future<GetLastMessagesModel> getLastMessages() async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getLastMessages}/1', options: await getDioHeader());
      return GetLastMessagesModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<OpenMessageModel> openMessage(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.openMessage}/1', options: await getDioHeader(), map: map);
      return OpenMessageModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<SendMessageModel> sendMessage(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.sendMessage}', options: await getDioHeader(), map: map);
      return SendMessageModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<CreateMessageModelList> createMessage(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.createMessage}', options: await getDioHeader(), map: map);
      return CreateMessageModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
