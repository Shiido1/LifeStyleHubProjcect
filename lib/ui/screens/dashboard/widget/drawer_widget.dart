import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';

import '../../../../helper/helper_handler.dart';
import '../../../../helper/routes/navigation.dart';
import '../../../../utils/pallets.dart';
import '../../../widgets/image_loader.dart';
import '../../../widgets/text_views.dart';
import '../../onboarding/viewmodel/tab_viewmodel.dart';

final _notifier = ChangeNotifierProvider((ref) => TabViewModel());

Consumer getDrawer(BuildContext context, int index) {
  context.read(_notifier);
  return Consumer(
    builder: (context, watch, child) {
      final _tabNotifier = watch(_notifier);
      return Container(
        width: getDeviceWidth(context) / 1.1,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 23),
            children: [
              SizedBox(
                height: getDeviceHeight(context) / 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: ImageLoader(
                    path: 'assets/svgs/x.svg',
                    onTap: () => PageRouter.goBack(context),
                  )),
              ValueListenableBuilder(
                  valueListenable: profileDao!.getListenable()!,
                  builder: (_, Box<dynamic> box, __) {
                    final _userInfo = profileDao!.convert(box);
                    return Row(
                      children: [
                        // Center(
                        //   child: Container(
                        //     margin: EdgeInsets.only(right: 10),
                        //     child: ImageLoader(
                        //       onTap: () => _tap(
                        //           tab: _tabNotifier,
                        //           context: context,
                        //           newIndex: 10),
                        //       isCircular: true,
                        //       radius: 40,
                        //       path: _userInfo.profilePic ?? '',
                        //     ),
                        //   ),
                        // ),
                        CircularImage(
                          onTap: () => null,
                          radius: 40,
                          path: _userInfo.profilePic ?? '',
                          initial: _userInfo.profilePic == null ? _userInfo.name?.substring(0, 2) : '',
                          showInitialTextAbovePicture: true,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: _userInfo.name ?? '',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Pallets.grey700,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextView(
                                text: 'Open notification',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Pallets.orange500,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Pallets.red500),
                            child: Center(
                              child: TextView(
                                text: '2',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Pallets.white,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 69,
              ),
              CustomDrawerTabs(
                title: 'Dashboard',
                image: 'assets/svgs/square_box.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 0,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 0,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Marketting tools',
                image: 'assets/svgs/marketing.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 1,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 1,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'My network',
                image: 'assets/svgs/network.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 2,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 2,
                newIndex: _tabNotifier.index!,
              ),
              CustomDrawerTabs(
                title: 'My commission',
                image: 'assets/svgs/stack.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 3,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 3,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Contest & Reward',
                image: 'assets/svgs/trophy.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 4,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 4,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Report',
                image: 'assets/svgs/report.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 5,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 5,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Wallet',
                image: 'assets/svgs/wallet.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 6,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 6,
                newIndex: _tabNotifier.index!,
              ),
              CustomDrawerTabs(
                title: 'Integrated point',
                image: 'assets/svgs/point.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 7,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 7,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Messaging',
                image: 'assets/svgs/messaging.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 8,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 8,
                newIndex: index,
              ),
              CustomDrawerTabs(
                title: 'Ticketting',
                image: 'assets/svgs/square_box.svg',
                onTap: () => _tap(
                    tab: _tabNotifier,
                    context: context,
                    newIndex: 9,
                    providerIndex: _tabNotifier.index),
                defaultIndex: 9,
                newIndex: index,
              )
            ],
          ),
        ),
      );
    },
  );
}

void _tap(
    {tab,
    BuildContext? context,
    int? newIndex,
    int? providerIndex,
    bool? drawer = true}) {
  if (newIndex == providerIndex && tab!.isFromDrawer) {
    PageRouter.goBack(context!);
    return;
  }
  tab!.switchDrawerIndex(context!, newIndex!);
}

/// Custom Tab
class CustomDrawerTabs extends StatelessWidget {
  final String? title;
  final String? image;
  final VoidCallback? onTap;
  final int defaultIndex;
  final int newIndex;

  const CustomDrawerTabs(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.defaultIndex,
      this.newIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: defaultIndex == newIndex
              ? Pallets.orange100
              : Colors.transparent),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ImageLoader(
          path: image,
          height: 20,
          dColor:
              defaultIndex == newIndex ? Pallets.orange500 : Pallets.grey400,
        ),
        title: TextView(
          text: title!,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: defaultIndex == newIndex ? Pallets.orange500 : Pallets.grey400,
          textAlign: TextAlign.left,
        ),
        onTap: onTap,
      ),
    );
  }
}
