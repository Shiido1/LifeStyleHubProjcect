import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/contest/widget/active_package_home_widget.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
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
    super.initState();
  }

  void _initialize() async {
    final _user = await profileDao!.convert();
    _tabViewModel = Provider.of<TabViewModel>(context, listen: false);
    _dashboardViewmodel =
        Provider.of<DashboardViewmodel>(context, listen: false);
    _dashboardViewmodel?.init(context);

    _dashboardViewmodel?.getDashboards(_user.role == "user");
    _contestViewModel = Provider.of<ContestViewModel>(context, listen: false);
    _contestViewModel?.init(context);
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel?.init(context);
    _packageViewmodel?.getPackages();
    _contestViewModel?.getListContest();
    _getCatchedInfos();
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
                      onTap: () => _tabViewModel?.switchDrawerIndex(context, 8),
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
                    onTap: () => _tabViewModel?.switchDrawerIndex(context, 4),
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
            ActivePackageHomeWidget(tabViewModel: _tabViewModel),
            SizedBox(
              height: 23,
            ),
            FutureBuilder(
                future: contestDao!.getListenable()!,
                builder: (BuildContext context,
                    AsyncSnapshot<ValueListenable<Box>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) return Container();
                  return ValueListenableBuilder(
                      valueListenable: snapshot.data!,
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
                      });
                }),
            SizedBox(
              height: 23,
            ),
            Consumer<VideoPlayer>(builder: (_, provider, __) {
              String _link =
                  _dashboardModel?.featuredVideo?.content?.path ?? '';
              if (_link.isNotEmpty) {
                provider.playVideo(_link);
                return BetterPlayerMultipleGestureDetector(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayer(
                        controller: provider.betterPlayerController),
                  ),
                );
              }

              return _dashboardModel?.featuredVideo?.featuredImage == null
                  ? Container()
                  : ImageLoader(
                      isCurvedEdge: true,
                      curve: 10,
                      height: 200,
                      fit: BoxFit.cover,
                      path: _dashboardModel?.featuredVideo?.featuredImage ?? '',
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
