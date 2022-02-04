import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../../../../../helper/helper_handler.dart';
import 'dao/wallet_dao.dart';
import 'model/view_wallet_transaction_model.dart';
import 'viewmodel/wallet_viewmodel.dart';
import '../../widget/multi_color_widget.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../../utils/pallets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllWalletScreen extends StatefulWidget {
  AllWalletScreen({Key? key}) : super(key: key);

  @override
  _AllWalletScreenState createState() => _AllWalletScreenState();
}

class _AllWalletScreenState extends State<AllWalletScreen> {
  WalletViewmodel? _walletViewmodel;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _walletViewmodel = Provider.of<WalletViewmodel>(context, listen: false);
    _walletViewmodel!.init(context);
    _refresh();
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  void _refresh() {
    _walletViewmodel!.awaitTwoProcesses(1);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Wallet Transactions',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: ValueListenableBuilder(
        valueListenable: walletDao!.getListenable()!,
        builder: (BuildContext context, Box<dynamic> box, Widget? child) {
          List<Data> walletList = walletDao!.convert(box).toList();
          return Consumer<WalletViewmodel>(builder: (context, watch, _) {
            if (watch.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmartRefresher(
                  controller: _refreshController,
                  enablePullUp: true,
                  onRefresh: () => _refresh(),
                  onLoading: () => watch.paginate(),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Expanded(
                          //   flex: 7,
                          //   child: EditFormField(
                          //     label: 'Search tickets',
                          //     controller: null,
                          //     keyboardType: TextInputType.emailAddress,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 16,
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     height: 48,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(8),
                          //         color: Pallets.orange500),
                          //     child: Center(
                          //         child: ImageLoader(
                          //             onTap: () => showTicketFiltering(context,
                          //                 callBack: (filter) {}),
                          //             path: 'assets/svgs/filter.svg')),
                          //   ),
                          // )
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
