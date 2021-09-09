import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'dao/my_account_package_dao.dart';
import '../../../widget/active_packages.dart';
import '../../../../../widgets/bottom_count_down.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../../utils/pallets.dart';

import 'model/my_accounts_model.dart';
import 'viewmodel/package_viewmodel.dart';
import 'widget/tabs.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  int? _tabIndex = 0;

  final _profilePackageProvider =
      ChangeNotifierProvider((_) => PackageViewmodel());
  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = context.read(_profilePackageProvider);
    _packageViewmodel!.init(context);
    _packageViewmodel!.getMyAccountPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(context,
            title: 'Packages',
            showLeadig: true,
            showImage: false,
            showMoreMenu: true,
            centerTitle: true,
            onTap: () => null),
        body: Consumer(builder: (_, watch, __) {
          final _packageWatch = watch(_profilePackageProvider);
          if (_packageWatch.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ValueListenableBuilder(
              valueListenable: accountPackageDao!.getListenable()!,
              builder: (_, Box<dynamic> box, __) {
                List<MyAccountsModel> _packageList =
                    accountPackageDao!.convert(box).toList();
                return SafeArea(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Pallets.orange50),
                              child: Row(
                                children: [
                                  Tabs(
                                    defaultID: 0,
                                    dynamicID: _tabIndex,
                                    title: 'Active',
                                    onTap: () => setState(() => _tabIndex = 0),
                                  ),
                                  Tabs(
                                    defaultID: 1,
                                    dynamicID: _tabIndex,
                                    title: 'Completed',
                                    onTap: () => setState(() => _tabIndex = 1),
                                  ),
                                  Tabs(
                                    defaultID: 2,
                                    dynamicID: _tabIndex,
                                    title: 'Inactive',
                                    onTap: () => setState(() => _tabIndex = 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  if (_tabIndex! == 0)
                                    ..._packageList
                                        .map((package) => Visibility(
                                            visible:
                                                package.status!.toLowerCase() ==
                                                    'active',
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 23),
                                                child: ActivePackageWidget(
                                                  title: 'Active',
                                                  subtitle: 'Subtitle',
                                                  spaceHeight: 31,
                                                ))))
                                        .toList(),
                                  if (_tabIndex! == 1)
                                    ..._packageList
                                        .map((package) => Visibility(
                                            visible:
                                                package.status!.toLowerCase() ==
                                                    'completed',
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 23),
                                                child: ActivePackageWidget(
                                                  title: 'Active',
                                                  subtitle: 'Subtitle',
                                                  spaceHeight: 31,
                                                ))))
                                        .toList(),
                                  if (_tabIndex! == 2)
                                    ..._packageList
                                        .map((package) => Visibility(
                                            visible:
                                                package.status!.toLowerCase() ==
                                                    'inactive',
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 23),
                                                child: ActivePackageWidget(
                                                  title: 'Active',
                                                  subtitle: 'Subtitle',
                                                  spaceHeight: 31,
                                                ))))
                                        .toList(),
                                  SizedBox(
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtomCountDownWidget()
                    ],
                  ),
                );
              });
        }));
  }
}
