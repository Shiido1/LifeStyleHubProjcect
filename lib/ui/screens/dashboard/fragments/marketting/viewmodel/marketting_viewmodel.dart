import 'package:flutter/material.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../dao/marketting_dao.dart';
import '../model/get_resources_model.dart';
import '../repository/marketting_repository.dart';
import '../../../../../../utils/pallets.dart';

MarkettingRepository _markettingRepository = MarkettingRepository();

class MarkettingViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  List<Data>? _getResourcesModelList = [];

  List<Data>? get getResourceModelList => _getResourcesModelList;

  Data? _getResourceModel;

  Data? get getResourceModel => _getResourceModel;

  // final RefreshController _refreshController = RefreshController();

  // RefreshController get refreshController => _refreshController;

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

  /// creates marketting
  Future<void> createMarketting(Map map) async {
    try {
      _showLoading();
      // ignore: unused_local_variable
      final _reponse = await _markettingRepository.createMarketting(map);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// get list of marketing
  Future<void> getMarketing() async {
    try {
      if (markettingDao!.box!.isEmpty) _showLoading();
      final _response = await _markettingRepository.getMarketting();
      markettingDao!.saveContents(_response.data!);
      // _refreshController.refreshCompleted();
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
      // _refreshController.refreshFailed();
    }
    _hideLoading();
  }

  /// get list of marketing
  Future<void> getMarketingViewAll(String path,
      {int page = 1,
      bool isRefreshing = false,
      bool isLoadMore = false}) async {
    try {
      if (_getResourcesModelList!.length == 0) _showLoading();
      final _response =
          await _markettingRepository.getMarkettingAll(path, page: page);
      if (_response.data!.isNotEmpty) {
        _getResourcesModelList!.addAll(_response.data!);
      }
      if (isRefreshing) _isRefreshing();

      if (isLoadMore) _isLoadMore(_response.data!);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
      // _refreshController.refreshFailed();
      // _refreshController.loadFailed();
    }
    _hideLoading();
  }

  void _isRefreshing() {
    _page = 1;
    notifyListeners();
    // _refreshController.refreshCompleted();
  }

  void _isLoadMore(List list) {
    isPagination = false;
    if (list.isEmpty) {
      // _refreshController.loadNoData();
    } else {
      // _refreshController.loadComplete();
    }
  }

  int _page = 1;
  bool isPagination = false;

  void loadPagination(String path) {
    _page++;
    isPagination = true;
    notifyListeners();
    getMarketingViewAll(path, page: _page, isLoadMore: true);
  }

  List<Data> videoContents = [];
  List<Data> postsContents = [];
  List<Data> bannerContents = [];

  ///[Mock] sort video contents
  void sortContentByType(List<Data>? data) {
    videoContents = data!
        .where((element) => element.type!.toLowerCase() == 'video')
        .toList();

    postsContents =
        data.where((element) => element.type!.toLowerCase() == 'post').toList();

    bannerContents = data
        .where((element) => element.type!.toLowerCase() == 'banner')
        .toList();
  }

  /// @Return at least One content from either of the sorted
  /// lists
  dynamic getSingleContent() {
    if (videoContents.isNotEmpty) return videoContents.first;
    if (postsContents.isNotEmpty) return postsContents.first;
    if (bannerContents.isNotEmpty) return bannerContents.first;
    return null;
  }

  /// get single of marketting details
  Future<void> getMarkettingDetails(String id) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.getMarkettingDetails(id);
      _getResourceModel = _reponse;
      _hideLoading();
    } catch (e) {
      _hideLoading();
      showsnackBarInfo(this._context, message: e.toString());
    }
  }

  /// updates a single marketting details
  Future<void> updateMarkettingDetails(String id, {dynamic formData}) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.updateMarkettingDetails(id,
          formData: formData);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }

  /// deletes a single marketting details
  Future<void> deleteMarketting(String id) async {
    try {
      _showLoading();
      final _reponse = await _markettingRepository.deleteMarkettingDetails(id);
      showsnackBarInfo(_context,
          message: _reponse.message, bgColor: Pallets.grey800);
    } catch (e) {
      showsnackBarInfo(this._context, message: e.toString());
    }
    _hideLoading();
  }
}
