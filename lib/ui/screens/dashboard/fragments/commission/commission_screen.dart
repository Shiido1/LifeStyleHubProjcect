import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/dao/commission_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/model/commission_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/viewmodel/commission_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/widgets/integrated_points_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/widgets/point_break_down_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_transaction_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/multi_color_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/second_icon.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/wallet_balance_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class CommissionScreen extends StatefulWidget {
  CommissionScreen({Key? key}) : super(key: key);

  @override
  _CommissionScreenState createState() => _CommissionScreenState();
}

class _CommissionScreenState extends State<CommissionScreen> {
  final _commissionProvider =
      ChangeNotifierProvider((ref) => CommissionViewmodel());

  CommissionViewmodel? _commissionViewmodel;

  @override
  void initState() {
    _commissionViewmodel = context.read(_commissionProvider);
    _commissionViewmodel!.init(context);
    _commissionViewmodel!.getCommissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: commissionDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        List<CommissionHistory> commissionList =
            commissionDao!.convert(box).toList();
        return Consumer(builder: (context, watch, _) {
          final _commission = watch(_commissionProvider);
          if (_commission.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  IntegratedPointAndCommissionWidget(
                    total: 'Total commission',
                    totalPoint: formatCurrency(10),
                    claimed: 'Claimed',
                    totalClaimed: formatCurrency(10),
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
                  SizedBox(
                    height: 23,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: commissionList.length,
                      itemBuilder: (context, index) {
                        final commission = commissionList[index];
                        return MultiColorWidget(
                            title: commission.fullname,
                            bgColor: index % 2 == 0
                                ? Pallets.orange100
                                : Pallets.white,
                            package: commission.package,
                            points: formatCurrency(commission.amount ?? 0),
                            date: fomartDate(commission.date!));
                      }),
                ],
              ));
        });
      },
    );
  }
}
