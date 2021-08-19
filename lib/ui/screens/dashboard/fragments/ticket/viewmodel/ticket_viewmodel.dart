import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';
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
  Future<void> ticketStatus(Map map) async {
    try {
      _showLoading();
      final _reponse = await _ticketRepository.postMyTicketStatus(map);
      logger.d(_reponse.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of tickets
  Future<void> getAllTickets() async {
    try {
      _showLoading();
      final _response = await _ticketRepository.getMyTicket();
      _myTicketModel = _response;
      _fetchByFiveItems(_response);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
    logger.d(_myTicketModel!.toJson());
  }

  /// fetch first 5 items
  void _fetchByFiveItems(MyTicketModel response){
    int _index = response.data!.length <= 5 ?  response.data!.length : 5;
    for(int i = 0; i < _index; i++ ){
      data!.add(response.data![i]);
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
