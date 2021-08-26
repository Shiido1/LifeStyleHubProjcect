import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/commission/viewmodel/commission_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/widgets/integrated_points_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/integrated/widgets/point_break_down_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_transaction_model.dart';
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
      valueListenable: walletDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        List<Data> walletList = walletDao!.convert(box).toList();
        return Consumer(builder: (context, watch, _) {
          // final _wallet = watch(_walletProvider);
          // if (_wallet.loading) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  IntegratedPointWidget(),
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
                  ...walletList
                      .map((wallet) => Container(
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
                                        text: wallet.type ?? '',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Pallets.grey800,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextView(
                                        text:
                                            formatCurrency(wallet.amount ?? 0),
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
                                        text: wallet.referenceId ?? '',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Pallets.grey500,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextView(
                                        text: fomartDate(wallet.date!),
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
