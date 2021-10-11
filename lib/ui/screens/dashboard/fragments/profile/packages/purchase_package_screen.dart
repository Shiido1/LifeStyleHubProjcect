import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/model/view_packages_model.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';

import 'dao/package_dao.dart';
import 'viewmodel/package_viewmodel.dart';

class PurchasePackageScreen extends StatefulWidget {
  const PurchasePackageScreen({Key? key}) : super(key: key);

  @override
  _PurchasePackageScreenState createState() => _PurchasePackageScreenState();
}

class _PurchasePackageScreenState extends State<PurchasePackageScreen> {
  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    _packageViewmodel!.getPackages();
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
            ValueListenableBuilder(
                valueListenable: packageDao!.getListenable()!,
                builder: (_, Box<dynamic> box, __) {
                  final _packages = packageDao!.convert(box).toList();
                  return DefaultTabController(
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelColor: Pallets.grey400,
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: [
                                    Tab(text: 'Extra Luxury'),
                                    Tab(text: 'Solid Refuge'),
                                  ],
                                ),
                              ),
                              Container(
                                  height: getDeviceHeight(context) / 1.5,
                                  child: TabBarView(children: <Widget>[
                                    ListView(
                                      children: _packages
                                          .map((element) =>
                                              element.type?.toLowerCase() ==
                                                      'extra luxury'
                                                  ? ContentCard(element, onTap: (){},)
                                                  : Container())
                                          .toList(),
                                    ),
                                    ListView(
                                      children: _packages
                                          .map((element) =>
                                              element.type?.toLowerCase() !=
                                                      'extra luxury'
                                                  ? ContentCard(element, onTap: (){},)
                                                  : Container())
                                          .toList(),
                                    ),
                                  ]))
                            ]),
                      ));
                }),
          ]),
        ),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final ViewPackagesModel? element;
  final Function()? onTap;

  const ContentCard(this.element, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Pallets.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.5, vertical: 9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Pallets.grey50,
                  border: Border.all(color: Pallets.grey200)),
              child: TextView(
                text: element?.type ?? '',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Pallets.orange500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              element?.image == null
                  ? Container(
                      height: 56,
                      width: 56,
                    )
                  : ImageLoader(
                      height: 56,
                      width: 56,
                      path: element?.image ?? '',
                    ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView(
                      text: element?.name ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Pallets.grey900,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    TextView(
                      text: '\$${element?.value ?? 0}',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Pallets.grey400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Pallets.orange600,
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextView(
                  text: element?.subscription ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Pallets.orange600,
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextView(
                  text: element?.description ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Pallets.grey800,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          SizedBox(height: 24),
          ButtonWidget(
            width: getDeviceWidth(context),
            buttonText: 'Subscribe now',
            color: Pallets.white,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            fontStyle: FontStyle.normal,
            primary: Pallets.orange600,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
