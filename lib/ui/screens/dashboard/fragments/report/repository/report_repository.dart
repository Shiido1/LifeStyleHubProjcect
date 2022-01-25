import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/free_member_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_promotion_income_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_summary_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_vpp_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/report_vpp_upgraded_analysis_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/upgraded_member_model.dart';

import '../../../../../../helper/configs/instances.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../utils/paths.dart';

class ReportRepository {
  Future<ReportPromotionSummaryModel> reportPromotionSummary() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionSummary, options: await getDioHeader());
      return ReportPromotionSummaryModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<FreeMemberModel> freeTrialMembers() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionFreeMember, options: await getDioHeader());
      return FreeMemberModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<UpgradedMemberModel> upgradedMembers() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionUpgradedMember,
          options: await getDioHeader());
      return UpgradedMemberModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<ReportPromotionIncomeAnalysisModelList>
      promotionIncomeAnalysis() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionIncome, options: await getDioHeader());
      return ReportPromotionIncomeAnalysisModelList.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<VVPFreeMemberTrail>
      vppFreeMembeAnalysis() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionVppMember, options: await getDioHeader());
      return VVPFreeMemberTrail.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }

  Future<VVPUpgradedAnalysisModel>
      vppUpgradedAnalysis() async {
    try {
      final _response = await apiBaseHelper.get(
          url: Paths.reportPromotionVppUpgradedMember, options: await getDioHeader());
      return VVPUpgradedAnalysisModel.fromJson(_response);
    } catch (e) {
      throw e;
    }
  }
}
