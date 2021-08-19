import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_hub/database/users_data_provider.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/contest_widget.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/widget/second_icon.dart';
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

  @override
  void initState() {
    _initializeVideoPlayer();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    context.read(_userModelProvider).getUsersData();
    return Consumer(builder: (context, watch, _) {
      final _userData = watch(_userModelProvider);
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
                text: _userData.user.name ?? '',
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
                                  text: '20',
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
                        money: '\$10,000',
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
                        money: '25',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: 'Active packages',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey500,
                    textAlign: TextAlign.left,
                  ),
                  TextView(
                    onTap: () {},
                    text: 'View all',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey500,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ActivePackageWidget(
                      title: 'VVIP',
                      percent: 80,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ActivePackageWidget(
                      title: 'Haven 1.0',
                      percent: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: 'Contest',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallets.grey500,
                    textAlign: TextAlign.left,
                  ),
                  TextView(
                    onTap: () {},
                    text: 'View all',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Pallets.grey500,
                    textAlign: TextAlign.left,
                  ),
                ],
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
                  child: BetterPlayer(controller: _betterPlayerController),
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
  }
}
