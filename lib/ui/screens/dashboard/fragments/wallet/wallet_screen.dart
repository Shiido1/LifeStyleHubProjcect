import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/dao/wallet_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_transaction_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/wallet_balance_widget.dart';
import 'package:lifestyle_hub/ui/widgets/overlay.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _walletProvider = ChangeNotifierProvider((ref) => WalletViewmodel());

  WalletViewmodel? _walletViewmodel;

  @override
  void initState() {
    _walletViewmodel = context.read(_walletProvider);
    _walletViewmodel!.init(context);
    _refresh();
    super.initState();
  }

  void _refresh() {
    _walletViewmodel!.checkWallet();
    _walletViewmodel!.walletTransactions(1);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: walletDao!.getListenable()!,
      builder: (BuildContext context, Box<dynamic> box, Widget? child) {
        List<Data> walletList = walletDao!.convert(box).toList();
        return Consumer(builder: (context, watch, _) {
          final _wallet = watch(_walletProvider);
          if (_wallet.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmartRefresher(
                controller: _wallet.refreshController,
                enablePullUp: true,
                onRefresh: () => _refresh(),
                onLoading: () => _wallet.paginate(),
                child: ListView(
                  children: [
                    WalletBalanceWidget(),
                    SizedBox(height: 23),
                    ViewAllButton(
                      title: 'My wallet history',
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
                                          text: formatCurrency(
                                              wallet.amount ?? 0),
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
                ),
              ));
        });
      },
    );
  }
}
