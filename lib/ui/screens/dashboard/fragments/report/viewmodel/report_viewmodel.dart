import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/free_member_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_promotion_income_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_summary_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/upgraded_member_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../repository/report_repository.dart';

ReportRepository _reportRepository = ReportRepository();

class ReportViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

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

  ReportPromotionSummaryModel? reportPromotionSummaryModel;

  /// get users profile
  Future<void> reportPromotionSummary() async {
    try {
      ///  _showLoading();
      final _response = await _reportRepository.reportPromotionSummary();
      reportPromotionSummaryModel = _response;
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// get trial members
  List<FreeTrialMembers>? freeTrialMembers = [];
  Future<void> reportPromotionTrialMembers() async {
    try {
      if (freeTrialMembers!.isEmpty) _showLoading();
      final _response = await _reportRepository.freeTrialMembers();
      freeTrialMembers = _response.freeTrialMembers ?? [];
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// get trial members
  List<UpgradedMembers>? upgradedMembers = [];
  Future<void> reportPromotionUpgradedMembers() async {
    try {
      if (upgradedMembers!.isEmpty) _showLoading();
      final _response = await _reportRepository.upgradedMembers();
      upgradedMembers = _response.upgradedMembers ?? [];
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// get promotion income analysis
  List<ReportPromotionIncomeAnalysisModel>? promotionIncomeAnalysis = [];
  List<FlSpot> analysisData = [];
  List<PieChartSectionData> pieAnalysisData = [];

  Future<void> promotionIncome() async {
    try {
      if (promotionIncomeAnalysis!.isEmpty) _showLoading();
      final _response = await _reportRepository.promotionIncomeAnalysis();
      promotionIncomeAnalysis =
          _response.reportPromotionIncomeAnalysisModel ?? [];
      if (pieAnalysisData.isNotEmpty) {
        pieAnalysisData.clear();
      }
      for (var item in promotionIncomeAnalysis!) {
        analysisData
            .add(FlSpot(item.month!.toDouble(), item.amount!.toDouble()));
        pieAnalysisData.add(PieChartSectionData(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            value: item.amount!.toDouble(),
            showTitle: false,
            radius: 30));
      }
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }
}
