import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/widget/active_package_home_widget.dart';
import '../../../../../../helper/helper_handler.dart';
import 'package:provider/provider.dart';
import '../../../widget/active_packages.dart';
import '../../../../../widgets/bottom_count_down.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../../utils/pallets.dart';
import 'viewmodel/package_viewmodel.dart';
import 'widget/tabs.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  int? _tabIndex = 0;

  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    _packageViewmodel!.getPackages();
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
        body: Consumer<PackageViewmodel>(builder: (_, _packageWatch, __) {
          if (_packageWatch.loading) {
            return Center(
                child: SpinKitCubeGrid(
              color: Pallets.orange600,
              size: 50,
            ));
          }
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
                              // TODO 1: Replace the commented code below which fetches information from provider, update it using hive database
                              // ..._packageWatch.activePackages!
                              //     .map((package) => ActivePackageWidget(
                              //           title: package.name ?? '',
                              //           subtitle: package.type ?? '',
                              //           percentage: getPercentage(
                              //               directReferred:
                              //                   package.downlinesAcquired ?? 0,
                              //               directRequired:
                              //                   package.downlinesRequired ?? 0),
                              //         ))
                              //     .toList(),

                              /// RETURNS COMPLETED PACKAGES
                              if (_tabIndex! == 1)
                                ..._packageWatch.completedPackages!
                                    .map((package) => ActivePackageWidget(
                                          title: package.name ?? '',
                                          subtitle: package.type ?? '',
                                          percentage: getPercentage(
                                              directReferred:
                                                  package.downlinesAcquired ??
                                                      0,
                                              directRequired:
                                                  package.downlinesRequired ??
                                                      0),
                                        ))
                                    .toList(),

                            /// RETURNS IN-ACTIVE PACKAGES
                            if (_tabIndex! == 2)
                              ..._packageWatch.inactivePackages!
                                  .map((package) => ActivePackageWidget(
                                        title: package.name ?? '',
                                        subtitle: package.type ?? '',
                                        percentage: getPercentage(
                                            directReferred:
                                                package.downlinesAcquired ?? 0,
                                            directRequired:
                                                package.downlinesRequired ?? 0),
                                      ))
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
        }));
  }
}
