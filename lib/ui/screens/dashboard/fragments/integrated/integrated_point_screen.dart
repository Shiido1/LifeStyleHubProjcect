import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/dao/point_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/model/point_history_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_transaction_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'viewmodel/point_history_viewmodel.dart';
import 'widgets/integrated_points_widget.dart';
import 'widgets/point_break_down_widget.dart';

class IntegratedPointScreen extends StatefulWidget {
  IntegratedPointScreen({Key? key}) : super(key: key);

  @override
  _IntegratedPointScreenState createState() => _IntegratedPointScreenState();
}

class _IntegratedPointScreenState extends State<IntegratedPointScreen> {
  final _pointHistoryProvider =
  ChangeNotifierProvider((ref) => PointHistoryViewmodel());

  PointHistoryViewmodel? _pointHistoryViewmodel;

  @override
  void initState() {
    _pointHistoryViewmodel = context.read(_pointHistoryProvider);
    _pointHistoryViewmodel!.init(context);
    _pointHistoryViewmodel!.getPointHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pointHistoryDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        List<PointHistory> _pointHistory = pointHistoryDao!.convert(box).toList();
        return Consumer(builder: (context, watch, _) {
          final _pointWatch = watch(_pointHistoryProvider);
          if (_pointWatch.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  IntegratedPointAndCommissionWidget(
                    total: 'Total point',
                    totalPoint: '150',
                    claimed: 'Claimed point',
                    totalClaimed: '150',
                  ),
                  SizedBox(height: 23),
                  TextView(
                    text: 'Point breakdown',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 23),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PointBreakDownWidget(),
                        SizedBox(
                          width: 16,
                        ),
                        PointBreakDownWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: 23),
                  ViewAllButton(
                    title: 'Recent points',
                    viewAll: () {},
                  ),
                  SizedBox(height: 23),
                  ..._pointHistory
                      .map((point) =>
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(23),
                        decoration: BoxDecoration(
                            color: Pallets.orange100,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextView(
                                    text: point.name ?? '',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Pallets.grey800,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  child: TextView(
                                    text:
                                    point.points ?? 'N/A',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Pallets.grey800,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextView(
                                    text: point.package ?? '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Pallets.grey500,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  child: TextView(
                                    text: fomartDate(point.date!),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Pallets.grey500,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                      .toList(),
                ],
              ));
        });
      },
    );
  }
}
