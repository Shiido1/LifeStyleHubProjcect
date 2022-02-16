import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/vpp/vpp_profile.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/analytical_graph.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/card.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/chart/bar_chart.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/chart/income_bar_chart.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/sign_up_chart_container.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pie_chart/pie_chart.dart' as pieChart;
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class VPPTab extends StatefulWidget {
  VPPTab({Key? key}) : super(key: key);

  @override
  _VPPTabState createState() => _VPPTabState();
}

class _VPPTabState extends State<VPPTab> {
  ReportViewmodel? _reportViewmodel;
  bool? isChart = true;

  @override
  void initState() {
    _reportViewmodel = Provider.of<ReportViewmodel>(context, listen: false);
    _reportViewmodel!.init(context);
    _reportViewmodel!.reportPromotionSummary();
    _reportViewmodel!.reportPromotionTrialMembers();
    _reportViewmodel!.reportPromotionUpgradedMembers();
    _reportViewmodel!.promotionIncome();
    _reportViewmodel!.reportPromotionVppTrialMembers();
    _reportViewmodel!.reportPromotionVppUpgradedMembers();
    _reportViewmodel!.vppUpgradedMembersBarChartData();
    _reportViewmodel!.freeSignUpModelRes();
    _reportViewmodel!.upGradedMemmberModelRes();
    super.initState();
  }

  _container(
      {required int? point,
      required String? text,
      required Color? textColor,
      required Color? containerColor,
      VoidCallback? voidCallback,
      bool? isAdded = false,
      Widget? widget}) {
    return Container(
      width: getDeviceWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextView(
            text: '$point',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Pallets.black,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          TextView(
            text: text!,
            fontWeight: FontWeight.w700,
            color: textColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Visibility(
              visible: isAdded!,
              child: InkWell(onTap: voidCallback, child: widget))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportViewmodel>(builder: (_, provider, __) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                    child: _container(
                        point: provider.reportPromotionSummaryModel
                                ?.totalFreeTrialMembers ??
                            0,
                        text: 'Free trial\nmembers',
                        textColor: Pallets.blue500,
                        containerColor: Pallets.blue50)),
                SizedBox(width: 16),
                Expanded(
                    child: _container(
                        point: provider.reportPromotionSummaryModel
                                ?.totalUpgradedMembers ??
                            0,
                        text: 'Upgraded\nmembers',
                        textColor: Pallets.green500,
                        containerColor: Pallets.green50)),
              ],
            ),
            SizedBox(height: 16),
            _container(
                point:
                    provider.reportPromotionSummaryModel?.totalCommission ?? 0,
                text: 'Upgraded members',
                textColor: Pallets.lightBlue500,
                containerColor: Pallets.lightBlue50),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    child: _container(
                  point: provider
                          .reportPromotionSummaryModel?.totalFreeTrialMembers ??
                      0,
                  text: 'All my VPP',
                  textColor: Pallets.grey500,
                  containerColor: Pallets.orange50,
                  voidCallback: () => PageRouter.gotoWidget(
                      VPPInformationsScreen(null, isUpdate: false), context),
                  isAdded: true,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Pallets.orange500),
                          child: Icon(
                            Icons.add_rounded,
                            color: Pallets.white,
                            size: 15,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      TextView(
                        text: 'Add new',
                        fontWeight: FontWeight.w500,
                        color: Pallets.orange500,
                        fontSize: 12,
                      )
                    ],
                  ),
                )),
                SizedBox(width: 16),
                Expanded(
                    child: _container(
                        point: provider.reportPromotionSummaryModel
                                ?.totalUpgradedMembers ??
                            0,
                        isAdded: true,
                        widget: TextView(
                          text: '',
                          fontWeight: FontWeight.w500,
                          color: Pallets.lime700,
                          fontSize: 12,
                        ),
                        text: 'Active Members',
                        textColor: Pallets.grey500,
                        containerColor: Pallets.lime50)),
              ],
            ),
            Visibility(
              visible: provider.analysisData.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 35),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView(
                        text: isChart == true ? 'SignUp chart' : 'Income Chart',
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.left,
                        fontSize: 16,
                      ),
                      SizedBox(width: 11),
                      Icon(
                        Icons.info_outline,
                        color: Pallets.grey300,
                      )
                    ],
                  ),
                  isChart == true
                      ? Container(
                          height: 300,
                          child: ChartContainer(
                              title: 'Bar Chart',
                              chart: provider.freeSignUpModel == null
                                  ? Container()
                                  : BarChartContent()),
                        )
                      : Container(
                          height: 300,
                          child: ChartContainer(
                              title: 'Bar Chart',
                              chart: provider.upgradeSignUpModel == null
                                  ? Container()
                                  : IncomeBarChartContent()),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          isChart = true;
                        }),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_back,
                            color: Pallets.white,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Pallets.orange500,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      TextView(
                          text:
                              isChart == true ? 'Signup chart' : 'Income Chart',
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      InkWell(
                        onTap: () => setState(() {
                          isChart = false;
                        }),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Pallets.white,
                            size: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Pallets.orange500,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            TextView(
              text: 'Free trial members',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.left,
              fontSize: 16,
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: provider.freeMemberModel != null
                  ? provider.freeTrialMembers!
                      .map((element) => MemberCard(
                          element: MemberCardModel(
                              name: element.name,
                              phoneNo: element.phoneNo,
                              date: element.date)))
                      .toList()
                  : [],
            ),
            Visibility(
              visible: provider.pieAnalysisData.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24),
                  TextView(
                    text: 'Analytics ',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  SizedBox(height: 16),
                  provider.vvpFreeMemberTrail == null
                      ? Container()
                      : Container(
                          child: pieChart.PieChart(
                            chartType: ChartType.ring,
                            chartRadius: 245,
                            dataMap: provider.convertedVppMap(),
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: false,
                              legendShape: BoxShape.circle,
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: false,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Column(
              children: provider.vvpFreeMemberTrail?.vppAnalytics?.vpp != null
                  ? provider.vvpFreeMemberTrail!.vppAnalytics!.vpp!
                      .map((e) => AnalyticalGraph(
                            element: AnalyticsModel(
                                color: Pallets.amber400,
                                textClick: e.commission ?? 0,
                                textName: e.name ?? '',
                                textSignup: e.signups ?? 0),
                          ))
                      .toList()
                  : [],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Upgraded members',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontSize: 16,
                ),
                TextView(
                  text: 'View all',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  color: Pallets.grey400,
                  fontSize: 14,
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: provider
                          .vvpUpgradedAnalysisModel?.upgradedMembers?.data !=
                      null
                  ? provider.vvpUpgradedAnalysisModel!.upgradedMembers!.data!
                      .map((element) => MemberCard(
                          element: MemberCardModel(
                              name: element.name,
                              phoneNo: element.phoneNo,
                              date: element.date,
                              money: element.amount)))
                      .toList()
                  : [],
            ),
            Visibility(
              visible: provider.pieAnalysisData.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24),
                  TextView(
                    text: 'Analytics ',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  SizedBox(height: 16),
                  provider.vvpUpgradedAnalysisModel == null
                      ? Container()
                      : Container(
                          child: pieChart.PieChart(
                            chartType: ChartType.ring,
                            chartRadius: 245,
                            dataMap: provider.convertedVppUpgradedMap(),
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: false,
                              legendShape: BoxShape.circle,
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: false,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Column(
              children:
                  provider.vvpUpgradedAnalysisModel?.vppAnalytics?.vpp != null
                      ? provider.vvpUpgradedAnalysisModel!.vppAnalytics!.vpp!
                          .map((e) => AnalyticalGraph(
                                element: AnalyticsModel(
                                    textClick: e.commission!.toInt(),
                                    textName: e.name ?? '',
                                    textSignup: e.signups ?? 0),
                              ))
                          .toList()
                      : [],
            ),
            SizedBox(height: 32),
            SizedBox(
              height: 50,
            )
          ],
        ),
      );
    });
  }
}
