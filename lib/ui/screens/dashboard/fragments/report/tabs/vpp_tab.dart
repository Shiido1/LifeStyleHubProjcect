import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/network/vpp/vpp_profile.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/card.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/left_tile.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class VPPTab extends StatefulWidget {
  VPPTab({Key? key}) : super(key: key);

  @override
  _VPPTabState createState() => _VPPTabState();
}

class _VPPTabState extends State<VPPTab> {
  ReportViewmodel? _reportViewmodel;

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

  final List<FlSpot> dummyData1 = List.generate(3, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(10, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

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
              visible: provider.analysisData.isEmpty ? false : true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 35),
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
                        titlesData: flTitle(context),
                        gridData: flGrid(context),
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
                ],
              ),
            ),
            SizedBox(height: 24),
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
              children: provider.freeTrialMembers!
                  .map((element) => MemberCard(
                      element: MemberCardModel(
                          name: element.name,
                          phoneNo: element.phoneNo,
                          date: element.date)))
                  .toList(),
            ),
            Visibility(
              visible: provider.pieAnalysisData.isEmpty ? false : true,
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
                  Container(
                    child: AspectRatio(
                      aspectRatio: 2.5,
                      child: PieChart(
                        PieChartData(
                          borderData: FlBorderData(show: true),
                          centerSpaceRadius: 50,
                          sections: provider.pieAnalysisData,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
              children: provider.upgradedMembers!
                  .map((element) => MemberCard(
                      element: MemberCardModel(
                          name: element.name,
                          phoneNo: element.phoneNo,
                          date: element.date,
                          money: element.commission)))
                  .toList(),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      );
    });
  }
}
