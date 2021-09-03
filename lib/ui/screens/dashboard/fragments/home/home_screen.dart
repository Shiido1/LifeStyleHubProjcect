import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/database/users_data_provider.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/dao/dashboardd_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/model/dashboard_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/contest_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/second_icon.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/view_all_widget.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

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

  @override
  void initState() {
    context.read(_dashboardProvider).getDashboards();
    context.read(_userModelProvider).getUsersData();
    _initializeVideoPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dashboardDao!.getListenable()!,
        builder: (_, Box<dynamic> box, __) {
          DashboardModel _dashboard = dashboardDao!.convert(box);
          return Consumer(builder: (context, watch, _) {
            final _userData = watch(_userModelProvider);
            final _dashboardWatch = watch(_dashboardProvider);

            if (_dashboardWatch.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

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
                      text: _dashboard.name ?? _userData.user.name ?? '',
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
                                            _dashboard.pointBalance!)),
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
                      height: 48,
                    ),
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
                        children: _dashboard.activePackages!
                            .map(
                              (package) => ActivePackageWidget(
                                title: package.name ?? '',
                                subtitle: package.type ?? '',
                                percent: 80,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    ViewAllButton(
                      title: 'Contest',
                      viewAll: () {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ContestWidget(
                            title: '90-Day Car / Gold Qualification',
                            percent: 88,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ContestWidget(
                            title: '90-Day Car / Gold Qualification',
                            percent: 88,
                          ),
                        ],
                      ),
                    ),
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
