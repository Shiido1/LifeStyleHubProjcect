import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/routes/navigation.dart';
import '../integrated/dao/point_dao.dart';
import '../integrated/model/point_history_model.dart';
import '../integrated/viewmodel/point_history_viewmodel.dart';
import '../../../../../helper/helper_handler.dart';
import 'dao/commission_dao.dart';
import 'model/commission_model.dart';
import 'view_more_commission.dart';
import 'viewmodel/commission_viewmodel.dart';
import '../integrated/widgets/integrated_points_widget.dart';
import '../integrated/widgets/point_break_down_widget.dart';
import '../wallet/dao/wallet_dao.dart';
import '../wallet/model/view_wallet_transaction_model.dart';
import '../../widget/multi_color_widget.dart';
import '../../widget/second_icon.dart';
import '../../widget/view_all_widget.dart';
import '../../widget/wallet_balance_widget.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

class CommissionScreen extends StatefulWidget {
  CommissionScreen({Key? key}) : super(key: key);

  @override
  _CommissionScreenState createState() => _CommissionScreenState();
}

class _CommissionScreenState extends State<CommissionScreen> {
  final _commissionProvider =
      ChangeNotifierProvider((ref) => CommissionViewmodel());

  CommissionViewmodel? _commissionViewmodel;

  final _pointHistoryProvider =
      ChangeNotifierProvider((ref) => PointHistoryViewmodel());

  PointHistoryViewmodel? _pointHistoryViewmodel;

  @override
  void initState() {
    _commissionViewmodel = context.read(_commissionProvider);
    _commissionViewmodel!.init(context);
    _commissionViewmodel!.getCommissions();
    _pointHistoryViewmodel = context.read(_pointHistoryProvider);
    _pointHistoryViewmodel!.init(context);
    _pointHistoryViewmodel!.getPointHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: commissionDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        CommissionModel? _commissionModel = commissionDao!.convert(box);
        return Consumer(builder: (context, watch, _) {
          final _commission = watch(_commissionProvider);
          if (_commission.loading) {
            return Center(
              child: SpinKitCubeGrid(
                color: Pallets.orange600,
              ),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  IntegratedPointAndCommissionWidget(
                    total: 'Total commission',
                    totalPoint:
                        formatCurrency(_commissionModel.totalCommission ?? 0),
                    claimed: 'Claimed',
                    totalClaimed:
                        formatCurrency(_commissionModel.totalCommission ?? 0),
                  ),
                  SizedBox(height: 23),
                  TextView(
                    text: 'Recent activities',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey800,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 23),
                  ValueListenableBuilder(
                      valueListenable: pointHistoryDao!.getListenable()!,
                      builder: (_, Box<dynamic> box, __) {
                        PointHistoryModel _point =
                            pointHistoryDao!.convert(box);
                        if (_point.pointBreakdown == null) {
                          return Container();
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                        );
                      }),
                  SizedBox(height: 23),
                  Visibility(
                      visible: _commissionModel.commissionHistory!.data!.isEmpty
                          ? false
                          : true,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ViewAllButton(
                            title: 'Recent points',
                            viewAll: () => PageRouter.gotoWidget(
                                ViewMoreCommissionScreen(), context),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _commissionModel
                                  .commissionHistory?.data?.length,
                              itemBuilder: (context, index) {
                                final commission = _commissionModel
                                    .commissionHistory?.data?[index];
                                return MultiColorWidget(
                                    title: commission?.fullname ?? '',
                                    bgColor: index % 2 == 0
                                        ? Pallets.orange100
                                        : Pallets.white,
                                    package: commission?.packageName ?? '',
                                    points:
                                        formatCurrency(commission?.amount ?? 0),
                                    date: commission?.date ?? '');
                              }),
                        ],
                      ))
                ],
              ));
        });
      },
    );
  }
}
