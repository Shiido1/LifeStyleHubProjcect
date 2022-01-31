import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/helper_handler.dart';
import '../../../../../utils/pallets.dart';
import '../../../../widgets/text_views.dart';
import '../../widget/view_all_widget.dart';
import 'dao/point_dao.dart';
import 'model/point_history_model.dart';
import 'viewmodel/point_history_viewmodel.dart';
import 'widgets/integrated_points_widget.dart';
import 'widgets/point_break_down_widget.dart';

class IntegratedPointScreen extends StatefulWidget {
  IntegratedPointScreen({Key? key}) : super(key: key);

  @override
  _IntegratedPointScreenState createState() => _IntegratedPointScreenState();
}

class _IntegratedPointScreenState extends State<IntegratedPointScreen> {
  PointHistoryViewmodel? _pointHistoryViewmodel;

  @override
  void initState() {
    _pointHistoryViewmodel =
        Provider.of<PointHistoryViewmodel>(context, listen: false);
    _pointHistoryViewmodel!.init(context);
    _pointHistoryViewmodel!.getPointHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pointHistoryDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        PointHistoryModel _point = pointHistoryDao!.convert(box);
        return Consumer<PointHistoryViewmodel>(
            builder: (context, _pointWatch, _) {
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
                    totalPoint: '${_point.pointBalance ?? 0}',
                    claimed: 'Claimed point',
                    totalClaimed: '${_point.pointBalance ?? 0}',
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
                    child: _point.pointBreakdown == null
                        ? Container()
                        : Row(
                            children: _point.pointBreakdown!
                                .map((point) => PointBreakDownWidget(
                                      packageName: point.packageName ?? '',
                                      packageIcon: point.packageIcon ?? '',
                                      packageReward: point.reward ?? '',
                                      packageCheckOutPoint:
                                          '${point.checkoutPoints ?? 0}',
                                    ))
                                .toList(),
                          ),
                  ),
                  SizedBox(height: 23),
                  ViewAllButton(
                    title: 'Recent points',
                    showViewAll: false,
                    viewAll: () {},
                  ),
                  SizedBox(height: 23),
                  _point.pointHistory == null
                      ? Container()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: _point.pointHistory!.data!
                              .map((point) => Container(
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
                                                text: point.points ?? 'N/A',
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
                                                text:
                                                    'Subscribed for ${point.package} ?? '
                                                    '',
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
                        ),
                ],
              ));
        });
      },
    );
  }
}
