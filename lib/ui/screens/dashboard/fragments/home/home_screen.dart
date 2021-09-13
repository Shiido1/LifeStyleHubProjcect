import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../../helper/configs/instances.dart';
import '../../../../../database/users_data_provider.dart';
import '../../../../../helper/helper_handler.dart';
import '../../dao/dashboardd_dao.dart';
import '../contest/dao/contest_dao.dart';
import '../contest/model/view_contest_model.dart';
import '../contest/viewmodel/contest_viewmodel.dart';
import '../profile/packages/dao/package_dao.dart';
import '../profile/packages/model/view_packages_model.dart';
import '../profile/packages/viewmodel/package_viewmodel.dart';
import '../../model/dashboard_model.dart';
import '../../viewmodel/dashboard_viewmodel.dart';
import '../../widget/contest_widget.dart';
import '../../widget/second_icon.dart';
import '../../widget/view_all_widget.dart';
import '../../../onboarding/viewmodel/tab_viewmodel.dart';
import '../../../../widgets/text_views.dart';
import '../../../../../utils/pallets.dart';

import '../../widget/active_packages.dart';
import '../../widget/first_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  /// initialize video controller
  void _initializeVideoPlayer() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: false,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);
  }

  final _userModelProvider =
      ChangeNotifierProvider((ref) => UsersInfoViewModel());
  final _dashboardProvider =
      ChangeNotifierProvider((ref) => DashboardViewmodel());

  DashboardViewmodel? _dashboardViewmodel;

  final _contestProvider = ChangeNotifierProvider((_) => ContestViewModel());
  ContestViewModel? _contestViewModel;

  final _packageViewModelProvider =
      ChangeNotifierProvider((_) => PackageViewmodel());

  PackageViewmodel? _packageViewmodel;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    _dashboardViewmodel = context.read(_dashboardProvider);
    _dashboardViewmodel!.init(context);
    _dashboardViewmodel!.getDashboards();
    _contestViewModel = context.read(_contestProvider);
    _contestViewModel!.init(context);
    _packageViewmodel = context.read(_packageViewModelProvider);
    _packageViewmodel!.init(context);
    _packageViewmodel!.getPackages();
    context.read(_userModelProvider).getUsersData();
    _contestViewModel!.getListContest();
    _initializeVideoPlayer();
    setState(() {});
  }

  final _notifier = ChangeNotifierProvider((ref) => TabViewModel());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dashboardDao!.getListenable()!,
        builder: (_, Box<dynamic> box, __) {
          final _dashboard = dashboardDao!.convert(box);
          return Consumer(builder: (_, watch, __) {
            final _tabNotifierWatch = watch(_notifier);
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
                      text: _dashboard.name ?? '',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        text: formatCurrency(double.parse(
                                            _dashboard.pointBalance ?? '0')),
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
                              onTap: () {},
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
                              money: formatCurrency(
                                  _dashboard.incomeReceived ?? 0),
                              mainBgColor: Pallets.orange50,
                              smallBgColor: Pallets.orange200,
                              textColor: Pallets.orange500,
                              onTaP: () {}),
                          SizedBox(
                            width: 16,
                          ),
                          SecondIcon(
                              icon: 'assets/svgs/link.svg',
                              text: 'Referral link signup',
                              money: formatCurrency(
                                  _dashboard.referralLinkSignup ?? 0),
                              mainBgColor: Pallets.blue50,
                              smallBgColor: Pallets.blue200,
                              textColor: Pallets.blue500,
                              onTaP: () {}),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    packageDao!.getListenable() == null
                        ? Container()
                        : ValueListenableBuilder(
                            valueListenable: packageDao!.getListenable()!,
                            builder: (_, Box<dynamic> box, __) {
                              List<ViewPackagesModel> _packageList =
                                  packageDao!.convert(box).toList();
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ViewAllButton(
                                    title: 'Active packages',
                                    viewAll: () {},
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          _packageList.length <= 5
                                              ? _packageList.length
                                              : 5, (index) {
                                        final _package = _packageList[index];
                                        return Container(
                                          margin: EdgeInsets.only(right: 23),
                                          child: ActivePackageWidget(
                                            title: _package.name ?? '',
                                            subtitle:
                                                _package.description ?? '',
                                            percentage: getPercentage(
                                                directReferred:
                                                    _package.referralPoints ??
                                                        0,
                                                directRequired:
                                                    _package.directBonus ?? 0),
                                          ),
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
                                    viewAll: () {
                                      _tabNotifierWatch.switchDrawerIndex(
                                          context, 4,
                                          drawer: false);
                                    },
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
                                          child:
                                              ContestWidget(contest: _contest),
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
                    BetterPlayerMultipleGestureDetector(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child:
                            BetterPlayer(controller: _betterPlayerController),
                      ),
                      onTap: () {
                        print("Tap!");
                      },
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) / 10,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
