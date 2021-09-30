import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../model/create_message_model.dart';
import '../model/get_last_messages_model.dart';
import '../model/open_message_model.dart';
import '../model/send_message_model.dart';
import '../../../../../../utils/paths.dart';

class MessageRepository {
  Future<GetLastMessagesModel> getLastMessages({String? search}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getLastMessages}/1',
          queryParameters: {'search' : search},
          options: await getDioHeader());
      return GetLastMessagesModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<OpenMessageModel> openMessage(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.openMessage}/1',
          options: await getDioHeader(),
          map: map);
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
          url: '${Paths.createMessage}',
          options: await getDioHeader(),
          map: map);
      return CreateMessageModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
