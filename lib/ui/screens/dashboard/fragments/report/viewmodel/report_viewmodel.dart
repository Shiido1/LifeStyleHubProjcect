import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/free_member_model.dart'
    as freeMember;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/free_sign_up_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_promotion_income_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_summary_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_vpp_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_vpp_upgraded_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_vpp_upgraded_analysis_model.dart'
    as vppmodel;
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/upgrade_sign_up.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/upgraded_member_model.dart'
    as upgrade;
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../repository/report_repository.dart';

ReportRepository _reportRepository = ReportRepository();

// late String dateValue;
class ReportViewmodel extends BaseViewModel {
  late BuildContext _context;
  bool _loading = false;

  BuildContext get buildContext => _context;

  bool get loading => _loading;

  ReportPromotionSummaryModel? reportPromotionSummaryModel;
  List<freeMember.Analytics>? freeMemberModel;
  List<freeMember.Data>? freeTrialMembers;
  List<upgrade.Data>? upgradedMembers;
  List<upgrade.Analytics>? upgradedMembersAnalysis;
  List<PackageSignupBonus>? promotionIncomeAnalysis = [];
  List<FlSpot> analysisData = [];
  List<PieChartSectionData> pieAnalysisData = [];
  VVPFreeMemberTrail? vvpFreeMemberTrail;
  VVPUpgradedAnalysisModel? vvpUpgradedAnalysisModel;
  FreeSignUpList? freeSignUpModel;
  UpgradedSignUpList? upgradeSignUpModel;
  List<vppmodel.Vpp>? vpp;
  String? currentYear;

  List<BarChartGroupData> barChartIncomeGroupData = [];
  List<BarChartGroupData> barChartGroupData = [];
  List<LineChartBarData> lineChartBarData = [];

  late double signUpValue;

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

  Future<void> reportPromotionTrialMembers() async {
    try {
      if (freeTrialMembers == null) _showLoading();
      final _response = await _reportRepository.freeTrialMembers();
      freeTrialMembers = _response.freeTrialMembers?.data ?? [];
      freeMemberModel = _response.analytics ?? [];
      logger.d(freeMemberModel!.length);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Map<String, double> convertedMap() {
    Map<String, double> _map = Map<String, double>();
    freeMemberModel?.map((e) {
      if (e.name != "Total")
        _map[e.name!] = double.parse(e.signups!.toString());
    }).toList();
    // notifyListeners();
    return _map;
  }

  Map<String, double> convertedUpgradedMemberMap() {
    Map<String, double> ?_map = Map<String, double>();
    upgradedMembersAnalysis?.map((e) {
      if (e.name != "Total")
        _map[e.name??''] = double.parse(e.signups.toString());
    }).toList();
    // notifyListeners();
    return _map;
  }

  /// get trial members
  Future<void> reportPromotionUpgradedMembers() async {
    try {
      if (upgradedMembers == null) _showLoading();
      final _response = await _reportRepository.upgradedMembers();
      upgradedMembers = _response.upgradedMembers?.data ?? [];
      upgradedMembersAnalysis = _response.analytics ?? [];
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// get promotion income analysis
  Future<void> promotionIncome() async {
    try {
      if (promotionIncomeAnalysis!.isEmpty) _showLoading();
      final _response = await _reportRepository.promotionIncomeAnalysis();
      promotionIncomeAnalysis = _response.packageSignupBonus ?? [];
      logger.d('printing aconsole ${promotionIncomeAnalysis!.length}');
      logger.d('printing aconsole ${pieAnalysisData.length}');
      if (pieAnalysisData.isNotEmpty) {
        pieAnalysisData.clear();
      }
      for (var item in promotionIncomeAnalysis!) {
        analysisData.add(FlSpot(double.parse(item.month.toString()),
            double.parse(item.amount.toString())));

        logger.d('printing analysis line logger on console $analysisData');
        pieAnalysisData.add(PieChartSectionData(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            value: double.parse(item.amount.toString()),
            showTitle: false,
            radius: 30));
      }
      logger.d('printing pie analysis logger on console $pieAnalysisData');
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  /// get vpp trial members
  Future<void> reportPromotionVppTrialMembers() async {
    try {
      if (vvpFreeMemberTrail == null) _showLoading();
      final _response = await _reportRepository.vppFreeMembeAnalysis();
      vvpFreeMemberTrail = _response;
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Future<void> reportPromotionVppUpgradedMembers() async {
    try {
      if (vvpUpgradedAnalysisModel == null) _showLoading();
      final _response = await _reportRepository.vppUpgradedAnalysis();
      vvpUpgradedAnalysisModel = _response;
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Map<String, double> convertedVppMap() {
    Map<String, double> _map = Map<String, double>();
    vvpFreeMemberTrail?.vppAnalytics?.vpp?.map((e) {
      print('printing problem from DAY BFR yesterday ${e.signups.toString()}');

      _map[e.name!] = double.parse(e.signups!.toString());
    }).toList();
    return _map;
  }

  Map<String, double> convertedVppUpgradedMap() {
    Map<String, double> _map = Map<String, double>();
    vvpUpgradedAnalysisModel?.vppAnalytics?.vpp?.map((e) {
      _map[e.name!] = e.signups!.toDouble();
      print('printing problem from yesterday ${e.commission.toString()}');
    }).toList();
    vppUpgradedMembersBarChartData();
    return _map;
  }

  vppUpgradedMembersBarChartData() async {
    Map<String, double> _map = Map<String, double>();
    vvpUpgradedAnalysisModel?.upgradedMembers?.data?.map((e) {
      _map[e.name!] = e.amount!.toDouble();
      _map[e.amount.toString()] = e.amount!.toDouble();
      print('printing problem from amount ${e.amount.toString()}');
      print('printing problem from name ${e.name}');
      print('printing problem from date ${e.date!.substring(5, 7)}');
    }).toList();
    return _map;
  }

  freeSignUpModelRes() async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    String year = formatted.substring(0, 4);
    try {
      if (freeSignUpModel == null) _showLoading();
      final _response = await _reportRepository.freeSignUpModel(year: year);
      freeSignUpModel = _response;
      _getBarData(_response.freeSignup);

      _hideLoading();
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Future<void> _getBarData(List<FreeSignUpModel>? freeSignup) async {
    if (barChartGroupData.isNotEmpty) barChartGroupData.clear();
    for (int i = 0; i <= freeSignup!.length; i++) {
      barChartGroupData.add(
        BarChartGroupData(x: i, barRods: [
          BarChartRodData(
              y: double.parse(
                  upgradeSignUpModel?.upgrade?[i].signups?.toString() ?? ''),
              borderRadius: BorderRadius.zero,
              colors: [Pallets.green200, Pallets.green200]),
          BarChartRodData(
              y: double.parse(freeSignup[i].signups.toString()),
              borderRadius: BorderRadius.zero,
              colors: [Pallets.orange600, Pallets.orange600]),
        ]),
      );

    logger.d(upgradeSignUpModel?.upgrade?[i].signups?.toString());
    logger.d(double.parse(freeSignup[i].signups.toString()));
    }
    notifyListeners();
  }

  upGradedMemmberModelRes() async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    String year = formatted.substring(0, 4);
    try {
      if (upgradeSignUpModel == null) _showLoading();
      final _response = await _reportRepository.upgradeSignUpModel(year: year);
      upgradeSignUpModel = _response;
      _getIncomeBarData(_response.upgrade);
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Future<void> _getIncomeBarData(
      List<UpgradeSignUpModel>? upgradedSignup) async {
    if (barChartIncomeGroupData.isNotEmpty) barChartIncomeGroupData.clear();
    for (int i = 0; i <= upgradedSignup!.length; i++) {
      barChartIncomeGroupData.add(
        BarChartGroupData(x: i, barRods: [
          BarChartRodData(
              y: upgradedSignup[i].income?.toDouble() ?? .0,
              borderRadius: BorderRadius.zero,
              colors: [Pallets.orange600, Pallets.orange600]),
        ]),
      );
    }
  }
}
