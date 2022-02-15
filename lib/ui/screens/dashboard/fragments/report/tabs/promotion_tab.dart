import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/model/free_member_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/analytical_graph.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/card.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/chart/line_chart/line_chart.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart' as pieChart;

class PromotionTab extends StatefulWidget {
  PromotionTab({Key? key}) : super(key: key);

  @override
  _PromotionTabState createState() => _PromotionTabState();
}

class _PromotionTabState extends State<PromotionTab> {
  ReportViewmodel? _reportViewmodel;
  Analytics? analytics;

  @override
  void initState() {
    _reportViewmodel = Provider.of<ReportViewmodel>(context, listen: false);
    _reportViewmodel!.init(context);
    _reportViewmodel!.reportPromotionSummary();
    _reportViewmodel!.reportPromotionTrialMembers();
    _reportViewmodel!.reportPromotionUpgradedMembers();
    _reportViewmodel!.promotionIncome();
    super.initState();
  }

  _container(
      {required int? point,
      required String? text,
      required Color? textColor,
      required Color? containerColor}) {
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
            text: point!.toString(),
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportViewmodel>(builder: (_, provider, __) {
      logger.d(provider.analysisData);
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
                      containerColor: Pallets.green50),
                )
              ],
            ),
            SizedBox(height: 16),
            _container(
                point:
                    provider.reportPromotionSummaryModel?.totalCommission ?? 0,
                text: 'Total\nCommission',
                textColor: Pallets.lightBlue500,
                containerColor: Pallets.lightBlue50),
            Visibility(
              visible: provider.analysisData.isNotEmpty,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView(
                        text: 'Income chart',
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
                  SizedBox(height: 44),
                  Container(
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        maxX: 11,
                        maxY: 3,
                        minX: 0,
                        minY: 0,
                        borderData: FlBorderData(show: false),
                        titlesData: flLineTitle(context),
                        gridData: flLineGrid(context),
                        lineBarsData: [
                          LineChartBarData(
                            spots: provider.analysisData,
                            isCurved: true,
                            barWidth: 3,
                            colors: [Pallets.blue500],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          returnGraphRow(
                              color: Pallets.blue500,
                              text: 'Package signup bonus'),
                          SizedBox(
                            height: 10,
                          ),
                          returnGraphRow(
                              color: Pallets.green500,
                              text: 'Contest & reward'),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          returnGraphRow(
                              color: Pallets.amber500,
                              text: 'Leadership bonus'),
                          SizedBox(
                            height: 10,
                          ),
                          returnGraphRow(
                              color: Pallets.red500,
                              text: 'Ecommerce referral'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Free trial members',
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                  fontSize: 16,
                ),
                TextView(
                  text: 'View all',
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  fontSize: 14,
                  color: Pallets.grey400,
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: provider.freeTrialMembers != null
                    ? provider.freeTrialMembers!
                        .map((element) => MemberCard(
                            element: MemberCardModel(
                                name: element.name,
                                phoneNo: element.phoneNo,
                                date: element.date)))
                        .toList()
                    : []),
            Visibility(
              visible: provider.pieAnalysisData.isNotEmpty,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  TextView(
                    text: 'Analytics ',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: pieChart.PieChart(
                      chartType: ChartType.disc,
                      chartRadius: 245,
                      dataMap: provider.convertedMap(),
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
            SizedBox(
              height: 28,
            ),
            Column(
              children: provider.freeMemberModel != null
                  ? provider.freeMemberModel!
                      .map((e) => AnalyticalGraph(
                            element: AnalyticsModel(
                                textClick: e.clicks!,
                                textName: e.name!,
                                textSignup: e.signups),
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
              children: provider.upgradedMembers != null
                  ? provider.upgradedMembers!
                      .map((element) => MemberCard(
                          element: MemberCardModel(
                              name: element.name,
                              phoneNo: element.phoneNo,
                              date: element.date,
                              money: element.commission)))
                      .toList()
                  : [],
            ),
            Visibility(
              visible: provider.pieAnalysisData.isNotEmpty,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  TextView(
                    text: 'Analytics ',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.left,
                    fontSize: 16,
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: pieChart.PieChart(
                      chartType: ChartType.disc,
                      chartRadius: 245,
                      dataMap: provider.convertedUpgradedMemberMap(),
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
            SizedBox(
              height: 28,
            ),
            Column(
              children: provider.upgradedMembersAnalysis != null
                  ? provider.upgradedMembersAnalysis!
                      .map((e) => AnalyticalGraph(
                            element: AnalyticsModel(
                                textClick: e.clicks!,
                                textName: e.name!,
                                textSignup: e.signups),
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

  returnGraphRow({Color? color, String? text}) => Row(
        children: [
          CircleAvatar(
            backgroundColor: color!,
            radius: 5.5,
          ),
          SizedBox(
            width: 10,
          ),
          TextView(
            text: text!,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Pallets.grey400,
          )
        ],
      );
}
