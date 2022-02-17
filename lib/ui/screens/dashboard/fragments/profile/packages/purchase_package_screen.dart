import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/model/view_wallet_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/wallet/viewmodel/wallet_viewmodel.dart';
import '../../../../../../helper/helper_handler.dart';
import '../../../../../../helper/routes/navigation.dart';
import '../dao/profile_dao.dart';
import '../model/users_profile_model.dart';
import 'payment/payment_screen.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../../../utils/pallets.dart';
import 'package:provider/provider.dart';

import 'viewmodel/package_viewmodel.dart';
import 'widget/content_card.dart';

class PurchasePackageScreen extends StatefulWidget {
  const PurchasePackageScreen({Key? key}) : super(key: key);

  @override
  _PurchasePackageScreenState createState() => _PurchasePackageScreenState();
}

class _PurchasePackageScreenState extends State<PurchasePackageScreen> {
  PackageViewmodel? _packageViewmodel;
  WalletViewmodel? _viewWalletModel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    _viewWalletModel = Provider.of<WalletViewmodel>(context, listen: false);
    _viewWalletModel!.init(context);
    _viewWalletModel!.checkWallet();
    _packageViewmodel!.getAvailablePackages();
    _getCatchedInfos();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao!.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context,
          title: 'Select a Package',
          showLeadig: true,
          centerTitle: true,
          image: _profileModel?.profilePic ?? '',
          initial: _profileModel?.name ?? 'LH'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextView(
              text: 'Select a package',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Pallets.grey800,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            TextView(
              text: 'Choose how to you want to grow in our network with ease',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Pallets.grey700,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 32),
            DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Pallets.grey800,
                            labelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                            unselectedLabelColor: Pallets.grey400,
                            unselectedLabelStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(text: 'Extra Luxury'),
                              Tab(text: 'Solid Refuge'),
                            ],
                          ),
                        ),
                        Consumer<PackageViewmodel>(
                          builder: (context, provider, child) {
                            return Container(
                                height: getDeviceHeight(context) / 1.5,
                                child: TabBarView(children: <Widget>[
                                  ListView(
                                    children: provider.packageListResponse!
                                        .map((element) => element.type
                                                    ?.toLowerCase() ==
                                                'extra luxury'
                                            ? ContentCard(element,
                                                onTap: () =>
                                                    PageRouter.gotoWidget(
                                                        PaymentScreen(element),
                                                        context))
                                            : Container())
                                        .toList(),
                                  ),
                                  ListView(
                                    children: provider.packageListResponse!
                                        .map((element) => element.type
                                                    ?.toLowerCase() !=
                                                'extra luxury'
                                            ? ContentCard(element,
                                                onTap: () =>
                                                    PageRouter.gotoWidget(
                                                        PaymentScreen(element),
                                                        context))
                                            : Container())
                                        .toList(),
                                  ),
                                ]));
                          },
                        )
                      ]),
                )),
          ]),
        ),
      ),
    );
  }
}
