import 'package:flutter/material.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/viewmodel/report_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/report/widget/card.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

class PromotionTab extends StatefulWidget {
  PromotionTab({Key? key}) : super(key: key);

  @override
  _PromotionTabState createState() => _PromotionTabState();
}

class _PromotionTabState extends State<PromotionTab> {
  ReportViewmodel? _reportViewmodel;

  @override
  void initState() {
    _reportViewmodel = Provider.of<ReportViewmodel>(context, listen: false);
    _reportViewmodel!.init(context);
    _reportViewmodel!.reportPromotionSummary();
    _reportViewmodel!.reportPromotionTrialMembers();
    _reportViewmodel!.reportPromotionUpgradedMembers();
    super.initState();
  }

  _container(
      {required int? point,
      required String? text,
      required Color? textColor,
      required Color? containerColor}) {
    return Expanded(
      child: Container(
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
          ],
        ),
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
                _container(
                    point: provider.reportPromotionSummaryModel
                            ?.totalFreeTrialMembers ??
                        0,
                    text: 'Free trial\nmembers',
                    textColor: Pallets.blue500,
                    containerColor: Pallets.blue50),
                SizedBox(width: 16),
                _container(
                    point: provider.reportPromotionSummaryModel
                            ?.totalUpgradedMembers ??
                        0,
                    text: 'Upgraded\nmembers',
                    textColor: Pallets.green500,
                    containerColor: Pallets.green50),
              ],
            ),
            SizedBox(height: 16),
            _container(
                point:
                    provider.reportPromotionSummaryModel?.totalCommission ?? 0,
                text: 'Total\nCommission',
                textColor: Pallets.lightBlue500,
                containerColor: Pallets.lightBlue50),
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

            /// Todo 1: Graph comes here
            TextView(
              text: 'Free trial members',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.left,
              fontSize: 16,
            ),
            SizedBox(height: 16),
            Consumer<ReportViewmodel>(
              builder: (context, report, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: report.freeTrialMembers!
                      .map((element) => MemberCard(
                          element: MemberCardModel(
                              name: element.name,
                              phoneNo: element.phoneNo,
                              date: element.date)))
                      .toList(),
                );
              },
            ),
            SizedBox(height: 24),

            /// Todo 2: Pie comes here
            TextView(
              text: 'Analytics ',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.left,
              fontSize: 16,
            ),
            SizedBox(
              height: 16,
            ),
            Consumer<ReportViewmodel>(
              builder: (context, report, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: report.upgradedMembers!
                      .map((element) => MemberCard(
                          element: MemberCardModel(
                              name: element.name,
                              phoneNo: element.phoneNo,
                              date: element.date,
                              money: element.commission)))
                      .toList(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
