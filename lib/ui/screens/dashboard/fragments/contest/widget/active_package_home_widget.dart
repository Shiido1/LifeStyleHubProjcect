import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/dao/active_package_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/widgets/empty_packages.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/active_packages.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';

class ActivePackageHomeWidget extends StatelessWidget {
  const ActivePackageHomeWidget({
    Key? key,
    required TabViewModel? tabViewModel,
  })  : _tabViewModel = tabViewModel,
        super(key: key);

  final TabViewModel? _tabViewModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: activePakageDao!.getListenable(),
      builder: (BuildContext context,
          AsyncSnapshot<ValueListenable<Box>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) return Container();

        return ValueListenableBuilder(
            valueListenable: snapshot.data!,
            builder: (_, Box<dynamic> box, __) {
              final _activePackages = activePakageDao!.convert(box).toList();

              if (_activePackages.isEmpty) return EmptyPackageWidget();

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewAllButton(
                    title: 'Active packages',
                    viewAll: () => _tabViewModel?.switchDrawerIndex(context, 7),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          _activePackages.length <= 5
                              ? _activePackages.length
                              : 5, (index) {
                        final _package = _activePackages[index];
                        return Container(
                          margin: EdgeInsets.only(right: 23),
                          child: ActivePackageWidget(
                            title: _package.name ?? '',
                            subtitle: _package.type ?? '',
                            percentage: getPercentage(
                                directReferred: _package.downlinesAcquired ?? 0,
                                directRequired:
                                    _package.downlinesRequired ?? 0),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
