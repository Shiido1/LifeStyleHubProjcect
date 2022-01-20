import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/purchase_package_screen.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/buttons.dart';
import 'package:lifestyle_hub/utils/images.dart';
import '../../../../../helper/video_player.dart';
import '../profile/dao/profile_dao.dart';
import '../profile/model/users_profile_model.dart';
import '../../model/dashboard_model.dart';
import '../../../../widgets/image_loader.dart';

import '../../../../../helper/helper_handler.dart';
import '../../../../../utils/pallets.dart';
import '../../../../widgets/text_views.dart';
import '../../dao/dashboardd_dao.dart';
import '../../viewmodel/dashboard_viewmodel.dart';
import '../../widget/active_packages.dart';
import '../../widget/contest_widget.dart';
import '../../widget/first_icons.dart';
import '../../widget/second_icon.dart';
import '../../widget/view_all_widget.dart';
import '../contest/dao/contest_dao.dart';
import '../contest/model/view_contest_model.dart';
import '../contest/viewmodel/contest_viewmodel.dart';
import '../profile/packages/viewmodel/package_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardViewmodel? _dashboardViewmodel;
  ContestViewModel? _contestViewModel;
  PackageViewmodel? _packageViewmodel;
  TabViewModel? _tabViewModel;

  @override
  void initState() {
    _initialize();
    _getCatchedInfos();
    super.initState();
  }

  void _initialize() async {
    final _user = await profileDao?.convert();
    _tabViewModel = Provider.of<TabViewModel>(context, listen: false);
    _dashboardViewmodel =
        Provider.of<DashboardViewmodel>(context, listen: false);
    _dashboardViewmodel?.init(context);

    _dashboardViewmodel?.getDashboards(_user?.role == "user");
    _contestViewModel = Provider.of<ContestViewModel>(context, listen: false);
    _contestViewModel?.init(context);
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel?.init(context);
    _packageViewmodel?.getPackages();
    _contestViewModel?.getListContest();
    setState(() {});
  }

  UsersProfileModel? _profileModel;
  DashboardModel? _dashboardModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao?.convert();
    _dashboardModel = await dashboardDao?.getUsersInformation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Welcome,',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Pallets.grey400,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            TextView(
              text: _profileModel?.name ?? '',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Pallets.grey700,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Pallets.green50,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        FirstIcons(
                          icon: 'assets/svgs/hash.svg',
                          bgColor: Pallets.green200,
                        ),
                        SizedBox(
                          width: 26.25,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Point Balance',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Pallets.grey500,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextView(
                                text: _dashboardModel?.pointBalance
                                        ?.replaceAll('.0', '') ??
                                    '',
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                color: Pallets.grey700,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextView(
                      onTap: () => _tabViewModel?.switchDrawerIndex(context, 7),
                      text: 'View all',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SecondIcon(
                    icon: 'assets/svgs/wallet.svg',
                    text: 'Income received',
                    money: formatCurrency(_dashboardModel?.incomeReceived ?? 0),
                    mainBgColor: Pallets.orange50,
                    smallBgColor: Pallets.orange200,
                    textColor: Pallets.orange500,
                    onTap: () => _tabViewModel?.switchDrawerIndex(context, 7),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SecondIcon(
                    icon: 'assets/svgs/link.svg',
                    text: 'Referral link signup',
                    money:
                        '${_dashboardModel?.referralLinkSignup?.toInt() ?? '0'}',
                    mainBgColor: Pallets.blue50,
                    smallBgColor: Pallets.blue200,
                    textColor: Pallets.blue500,
                    onTap: () => _tabViewModel?.switchDrawerIndex(context, 7),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Consumer<PackageViewmodel>(
              builder: (_, provider, __) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewAllButton(
                      title: 'Active packages',
                      viewAll: () =>
                          _tabViewModel?.switchDrawerIndex(context, 7),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    provider.activePackages!.isEmpty
                        ? Center(
                            child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.w),
                            width: getDeviceWidth(context),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextView(
                                  text: 'Active Packages',
                                  color: Pallets.grey500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                ImageLoader(
                                  path: AppImages.emptyFolder,
                                  height: 80,
                                  width: 80,
                                ),
                                TextView(
                                  text: ' No active packages',
                                  color: Pallets.grey400,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ButtonWidget(
                                  buttonText: 'Subscribe now',
                                  width: 200.w,
                                  color: Pallets.white,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  fontStyle: FontStyle.normal,
                                  borderColor: Pallets.orange500,
                                  primary: Pallets.orange500,
                                  onPressed: () => PageRouter.gotoWidget(
                                      PurchasePackageScreen(), context),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Pallets.grey100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                          ))
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  provider.activePackages!.length <= 5
                                      ? provider.activePackages!.length
                                      : 5, (index) {
                                final _package =
                                    provider.activePackages![index];
                                return Container(
                                  margin: EdgeInsets.only(right: 23),
                                  child: ActivePackageWidget(
                                    title: _package.name ?? '',
                                    subtitle: _package.type ?? '',
                                    percentage: getPercentage(
                                        directReferred:
                                            _package.downlinesAcquired ?? 0,
                                        directRequired:
                                            _package.downlinesRequired ?? 0),
                                  ),
                                );
                              }),
                            ),
                          ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 23,
            ),
            contestDao!.getListenable() == null
                ? Container()
                : ValueListenableBuilder(
                    valueListenable: contestDao!.getListenable()!,
                    builder: (_, Box<dynamic> box, __) {
                      List<ViewContestModel> _contestList =
                          contestDao!.convert(box).toList();
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ViewAllButton(
                            title: 'Contest',
                            viewAll: () =>
                                _tabViewModel!.switchDrawerIndex(context, 7),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  _contestList.length <= 5
                                      ? _contestList.length
                                      : 5, (index) {
                                final _contest = _contestList[index];
                                return Container(
                                  margin: EdgeInsets.only(right: 23),
                                  child: ContestWidget(contest: _contest),
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }),
            SizedBox(
              height: 23,
            ),
            Consumer<VideoPlayer>(builder: (_, provider, __) {
              String _link =
                  _dashboardModel?.featuredVideo?.content?.path ?? '';
              if (_link.isNotEmpty) provider.playVideo(_link);
              if (_link.isEmpty) {
                return ImageLoader(
                  isCurvedEdge: true,
                  curve: 10,
                  height: 200,
                  fit: BoxFit.cover,
                  path: _dashboardModel?.featuredVideo?.featuredImage ?? '',
                );
              }
              return BetterPlayerMultipleGestureDetector(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      BetterPlayer(controller: provider.betterPlayerController),
                ),
              );
            }),
            SizedBox(
              height: getDeviceHeight(context) / 10,
            ),
          ],
        ),
      ),
    );
  }
}
