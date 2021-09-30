import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import 'dao/wallet_dao.dart';
import 'model/view_wallet_transaction_model.dart';
import 'viewmodel/wallet_viewmodel.dart';
import '../../widget/multi_color_widget.dart';
import '../../widget/view_all_widget.dart';
import '../../widget/wallet_balance_widget.dart';
import '../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'all_wallet_screens.dart';

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
    _walletViewmodel!.awaitTwoProcesses(1);
    // _walletViewmodel!.checkWallet();
    // _walletViewmodel!.walletTransactions(1);
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
              child: SpinKitCubeGrid(
                color: Pallets.orange600,
              ),
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
                      viewAll: () =>
                          PageRouter.gotoWidget(AllWalletScreen(), context),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            walletList.length <= 5 ? walletList.length : 5,
                        itemBuilder: (context, index) {
                          final wallet = walletList[index];
                          return MultiColorWidget(
                              title: wallet.type,
                              bgColor: index % 2 == 0
                                  ? Pallets.orange100
                                  : Pallets.white,
                              package: wallet.referenceId,
                              points: formatCurrency(wallet.amount ?? 0),
                              date: fomartDate(wallet.date!));
                        }),
                  ],
                ),
              ));
        });
      },
    );
  }
}
