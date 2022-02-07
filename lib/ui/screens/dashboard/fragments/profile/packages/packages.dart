import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/active_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/complete_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/inactive_package_dao.dart';
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
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(360, 690),
    //     orientation: Orientation.portrait);
    return Scaffold(
        appBar: getCustomAppBar(context,
            title: 'Packages',
            showLeadig: true,
            showImage: false,
            showMoreMenu: true,
            centerTitle: true,
            onTap: () => null),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      // width: getDeviceWidth(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Pallets.orange50),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            FutureBuilder(
                              future: activePakageDao!.getListenable(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ValueListenable<Box>?>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) return Container();

                                return ValueListenableBuilder(
                                    valueListenable: snapshot.data!,
                                    builder: (_, Box<dynamic>? box, __) {
                                      final _activePackages = activePakageDao!
                                          .convert(box!)
                                          .toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: List.generate(
                                                  _activePackages.length <= 5
                                                      ? _activePackages.length
                                                      : 5, (index) {
                                                final _package =
                                                    _activePackages[index];
                                                return Container(
                                                  width:
                                                      getDeviceWidth(context),
                                                  padding: EdgeInsets.only(
                                                      bottom: 23),
                                                  child: ActivePackageWidget(
                                                    title: _package.name ?? '',
                                                    subtitle:
                                                        _package.type ?? '',
                                                    percentage: getPercentage(
                                                        directReferred: _package
                                                                .downlinesAcquired ??
                                                            0,
                                                        directRequired: _package
                                                                .downlinesRequired ??
                                                            0),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          if (_tabIndex! == 1)
                            FutureBuilder(
                              future: completePackageDao!.getListenable(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ValueListenable<Box>?>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) return Container();

                                return ValueListenableBuilder(
                                    valueListenable: snapshot.data!,
                                    builder: (_, Box<dynamic> box, __) {
                                      final _completePackages =
                                          completePackageDao!
                                              .convert(box)
                                              .toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: List.generate(
                                                  _completePackages.length <= 5
                                                      ? _completePackages.length
                                                      : 5, (index) {
                                                final _package =
                                                    _completePackages[index];
                                                return Container(
                                                  width:
                                                      getDeviceWidth(context),
                                                  padding: EdgeInsets.only(
                                                      bottom: 23),
                                                  child: ActivePackageWidget(
                                                    title: _package.name ?? '',
                                                    subtitle:
                                                        _package.type ?? '',
                                                    percentage: getPercentage(
                                                        directReferred: _package
                                                                .downlinesAcquired ??
                                                            0,
                                                        directRequired: _package
                                                                .downlinesRequired ??
                                                            0),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          if (_tabIndex! == 2)
                            FutureBuilder(
                              future: inactivePackageDao!.getListenable(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ValueListenable<Box>?>
                                      snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
                                    !snapshot.hasData) return Container();

                                return ValueListenableBuilder(
                                    valueListenable: snapshot.data!,
                                    builder: (_, Box<dynamic>? box, __) {
                                      final _inactivePackages =
                                          inactivePackageDao!
                                              .convert(box!)
                                              .toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: List.generate(
                                                  _inactivePackages.length <= 5
                                                      ? _inactivePackages.length
                                                      : 5, (index) {
                                                final _package =
                                                    _inactivePackages[index];
                                                return Container(
                                                  width:
                                                      getDeviceWidth(context),
                                                  padding: EdgeInsets.only(
                                                      bottom: 23),
                                                  child: ActivePackageWidget(
                                                    title: _package.name ?? '',
                                                    subtitle:
                                                        _package.type ?? '',
                                                    percentage: getPercentage(
                                                        directReferred: _package
                                                                .downlinesAcquired ??
                                                            0,
                                                        directRequired: _package
                                                                .downlinesRequired ??
                                                            0),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
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
        ));
  }
}
