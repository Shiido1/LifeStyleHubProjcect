import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../helper/helper_handler.dart';
import '../ticket/widget/filter_modal.dart';
import 'dao/wallet_dao.dart';
import 'model/view_wallet_transaction_model.dart';
import 'viewmodel/wallet_viewmodel.dart';
import '../../widget/multi_color_widget.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/edit_form_widget.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllWalletScreen extends StatefulWidget {
  AllWalletScreen({Key? key}) : super(key: key);

  @override
  _AllWalletScreenState createState() => _AllWalletScreenState();
}

class _AllWalletScreenState extends State<AllWalletScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Wallet History',
          showLeadig: true,
          image:
              'https://images.unsplash.com/photo-1558185348-fe8fa4cf631f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
          showImage: true,
          showMoreMenu: false,
          centerTitle: true,
          onTap: () {}),
      body: ValueListenableBuilder(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: EditFormField(
                              label: 'Search tickets',
                              controller: null,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Pallets.orange500),
                              child: Center(
                                  child: ImageLoader(
                                      onTap: () => showTicketFiltering(context,
                                          callBack: (filter) {}),
                                      path: 'assets/svgs/filter.svg')),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 23),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: walletList.length,
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
      ),
    );
  }
}
