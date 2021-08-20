import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_reply_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_status.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class TicketRepository {
  /// [@CREATE]
  Future<MyTicketStatusModel> postMyTicketStatus() async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.tickets}/status', header: await getHeader());
      return MyTicketStatusModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<MyTicketModel> getMyTicket() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.tickets, header: await getHeader());
      return MyTicketModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<Data> getMyTicketDetail({String id = ''}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.tickets}${id.isNotEmpty ? '$id' : ''}',
          header: await getHeader());
      return Data.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<MyTicketReplyModel> getMyTicketReply(String ticket, Map map) async {
    try {
      final _response = await apiBaseHelper.post(
          map: map,
          url: '${Paths.tickets}/$ticket/reply',
          header: await getHeader());
      return MyTicketReplyModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
