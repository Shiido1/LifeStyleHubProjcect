import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/active_packages.dart';
import 'package:lifestyle_hub/ui/widgets/custom_appbar.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

import 'widget/tabs.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  int? _tabIndex = 0;

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
      body: Padding(
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
                    ...[1, 2, 3, 4]
                        .map((package) => Container(
                            margin: EdgeInsets.only(bottom: 23),
                            child: ActivePackageWidget(
                              title: 'Active',
                              subtitle: 'Subtitle',
                              spaceHeight: 31,
                            )))
                        .toList(),
                  if (_tabIndex! == 1)
                    ...[1, 2, 3, 4]
                        .map((package) => Container(
                            margin: EdgeInsets.only(bottom: 23),
                            child: ActivePackageWidget(
                              title: 'Completed',
                              subtitle: 'Subtitle',
                              spaceHeight: 31,
                            )))
                        .toList(),
                  if (_tabIndex! == 2)
                    ...[1, 2, 3, 4]
                        .map((package) => Container(
                            margin: EdgeInsets.only(bottom: 23),
                            child: ActivePackageWidget(
                              title: 'Inactive',
                              subtitle: 'Subtitle',
                              spaceHeight: 31,
                            )))
                        .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
