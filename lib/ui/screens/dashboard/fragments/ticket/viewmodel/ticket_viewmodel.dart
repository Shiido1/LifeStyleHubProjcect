import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/dao/ticket_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/repository/ticket_repository.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

TicketRepository _ticketRepository = TicketRepository();

class TicketViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  MyTicketModel? _myTicketModel = MyTicketModel();

  MyTicketModel? get myTicketModel => _myTicketModel;

  List<Data>? data = [];

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

  ///
  Future<void> ticketStatus() async {
    try {
      final _response = await _ticketRepository.postMyTicketStatus();
      logger.d(_response.toJson());
      ticketDao!.cacheTicketStatus(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of tickets
  Future<void> getAllTickets() async {
    try {
      if (ticketDao!.box!.isEmpty) _showLoading();
      final _response = await _ticketRepository.getMyTicket();
      ticketDao!.saveTickets(_response.data);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// fetch first 5 items
  void fetchFiveItems(List<Data> response) {
    if (data!.isNotEmpty) data!.clear();
    int _index = response.length <= 5 ? response.length : 5;
    for (int i = 0; i < _index; i++) {
      data!.add(response[i]);
    }
  }

  /// get single of ticket details
  Future<void> getTicketDetails(String id) async {
    try {
      _showLoading();
      final _reponse = await _ticketRepository.getMyTicketDetail(id: id);
      logger.d(_reponse.toJson());
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }

  /// get tickets replies
  Future<void> getMyTicketReply(String id, Map map) async {
    try {
      _showLoading();
      final _reponse = await _ticketRepository.getMyTicketReply(id, map);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
