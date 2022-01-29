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
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../provider/_base_viewmodels.dart';
import '../repository/report_repository.dart';

ReportRepository _reportRepository = ReportRepository();

late double amountValue;
late double signUpValue;
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
  FreeSignUpModel? freeSignUpModel;
  UpgradeSignUpModel? upgradeSignUpModel;
  List<vppmodel.Vpp>? vpp;
  String? currentYear;

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
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Map<String, double> convertedMap() {
    Map<String, double> _map = Map<String, double>();
    freeMemberModel?.map((e) {
      if (e.name != "Total") _map[e.name!] = e.signups!.toDouble();
    }).toList();
    // notifyListeners();
    return _map;
  }

  Map<String, double> convertedUpgradedMemberMap() {
    Map<String, double> _map = Map<String, double>();
    upgradedMembersAnalysis?.map((e) {
      if (e.name != "Total") _map[e.name!] = e.signups!.toDouble();
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
      logger.d('print respone for upgrade members $vvpUpgradedAnalysisModel');
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    _hideLoading();
  }

  Map<String, double> convertedVppMap() {
    Map<String, double> _map = Map<String, double>();
    vvpFreeMemberTrail?.vppAnalytics?.vpp?.map((e) {
      print('printing problem from DAY BFR yesterday ${e.signups.toString()}');

      _map[e.name!] = e.signups!.toDouble();
    }).toList();
    // notifyListeners();
    return _map;
  }

  Map<String, double> convertedVppUpgradedMap() {
    Map<String, double> _map = Map<String, double>();
    vvpUpgradedAnalysisModel?.vppAnalytics?.vpp?.map((e) {
      _map[e.name!] = e.signups!.toDouble();
      print('printing problem from yesterday ${e.commission.toString()}');
      //amountValue = e.commission!.toDouble();

      // logger.d('print amount in code $amountValue');
    }).toList();
    vppUpgradedMembersBarChartData();
    // notifyListeners();
    return _map;
  }

  vppUpgradedMembersBarChartData(){
    Map<String, double> _map = Map<String, double>();
    vvpUpgradedAnalysisModel?.upgradedMembers?.data?.map((e) {
      _map[e.name!] = e.amount!.toDouble();
      _map[e.amount.toString()] = e.amount!.toDouble();
      print('printing problem from amount ${e.amount.toString()}');
      print('printing problem from name ${e.name}');
      print('printing problem from date ${e.date!.substring(5,7)}');
      // logger.d('print amount in code $amountValue');
    }).toList();
    methodToPrint();
    methodToPrint1();
    // notifyListeners();
    return _map;
  }

  methodToPrint()async{
    try {
      if (freeSignUpModel == null) _showLoading();
      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(now);
      String year = formatted.substring(0,4);
      print('formatted printing new year1 $year');
      String? valString = freeSignUpModel?.signups.toString();
      String val = valString!;
      signUpValue = double.parse(val);
      print('formatted printing new year ${signUpValue.toString()}');

      final _response = await _reportRepository.freeSignUpModel(year);

      freeSignUpModel = _response;
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    // _hideLoading();
  }
  methodToPrint1()async{
    try {
      if (upgradeSignUpModel == null) _showLoading();
      DateTime now = DateTime. now();
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(now);
      String year = formatted.substring(0,4);
      print('formatted printing new year2 $year');
      final _response = await _reportRepository.upgradeSignUpModel(year);

      upgradeSignUpModel = _response;
      amountValue= double.parse(upgradeSignUpModel!.income.toString());
      print('print amount income $amountValue');
    } catch (e) {
      logger.wtf('An unexpected error occurred! => $e');
    }
    // _hideLoading();
  }

}

