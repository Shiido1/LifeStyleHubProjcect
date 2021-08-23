import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/get_last_messages_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/messaging/model/open_message_model.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class MessageRepository {
  Future<GetLastMessagesModel> getLastMessages() async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.getLastMessages}/1', header: await getHeader());
      return GetLastMessagesModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<OpenMessageModel> openMessage(Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.openMessage}/1', header: await getHeader(), map: map);
      return OpenMessageModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
