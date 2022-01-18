import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/ticket/model/my_ticket_status.dart';
import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/dept_dao.dart';
import '../dao/ticket_dao.dart';
import '../model/my_ticket_model.dart';
import '../repository/ticket_repository.dart';
import '../../../../../../utils/pallets.dart';

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
    notifyListeners();
  }

  /// hide loading indicator
  void _hideLoading() {
    _loading = false;
    notifyListeners();
  }

  Future<void> createTicket(FormData formData) async {
    try {
      _showLoading(notify: true);
      final _response = await _ticketRepository.createNewTicket(formData);
      await getAllTickets(refresh: true);
      showsnackBarInfo(_context,
          message: _response.message ?? '', bgColor: Pallets.green600);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  ///
  Future<void> ticketStatus() async {
    try {
      final _response = await _ticketRepository.postMyTicketStatus();
      ticketDao!.cacheTicketStatus(_response.toJson());
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of tickets
  Future<void> getAllTickets({String? search, bool refresh = false}) async {
    try {
      if (ticketDao!.box!.isEmpty || refresh) _showLoading();
      final _response = await _ticketRepository.getMyTicket(search: search);
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
  Future<void> getTicketDepartments() async {
    try {
      if (deptDao!.box!.isEmpty) _showLoading();
      final _response = await _ticketRepository.getTicketDepartmental();
      await deptDao!.saveDept(_response.dList);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
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

  MyTicketStatusModel? myTicketStatusModel;

  Future getTicketStatus() async {
    myTicketStatusModel = await ticketDao!.getTicketStatus();
    notifyListeners();
  }
}
