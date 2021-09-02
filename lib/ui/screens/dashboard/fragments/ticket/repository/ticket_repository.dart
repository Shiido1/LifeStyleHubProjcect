import 'package:dio/dio.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/create_ticket_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/dept_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_reply_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_status.dart';
import 'package:lifestyle_hub/utils/paths.dart';

class TicketRepository {
  /// [@CREATE]
  Future<CreateTicketModel> createNewTicket(FormData formData) async {
    try {
      final _response = await apiBaseHelper.post(
          map: formData,
          url: '${Paths.tickets}',
          options: await getDioHeader());
      return CreateTicketModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@CREATE]
  Future<MyTicketStatusModel> postMyTicketStatus() async {
    try {
      final _response = await apiBaseHelper.post(
          url: '${Paths.tickets}/status', options: await getDioHeader());
      return MyTicketStatusModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<MyTicketModel> getMyTicket() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.tickets, options: await getDioHeader());
      return MyTicketModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<DepartmentModelList> getTicketDepartmental() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.departments, options: await getDioHeader());
      return DepartmentModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  /// [@Get]
  Future<Data> getMyTicketDetail({String id = ''}) async {
    try {
      final _response = await apiBaseHelper.get(
          url: '${Paths.tickets}${id.isNotEmpty ? '$id' : ''}',
          options: await getDioHeader());
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
          options: await getDioHeader());
      return MyTicketReplyModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
