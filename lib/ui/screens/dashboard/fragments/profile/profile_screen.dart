import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lifestyle_hub/helper/helper_handler.dart';
import 'package:lifestyle_hub/helper/routes/navigation.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/basic_informations.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/packages.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/viewmodel/profile_viewmodel.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/ui/widgets/text_views.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:page_transition/page_transition.dart';

import 'widget/custom_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileProvider = ChangeNotifierProvider((_) => ProfileViewmodel());
  ProfileViewmodel? _profileViewmodel;

  @override
  void initState() {
    _profileViewmodel = context.read(_profileProvider);
    _profileViewmodel!.init(context);
    _profileViewmodel!.getUsersProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: profileDao!.getListenable()!,
        builder: (_, Box<dynamic> box, __) {
          final _userInfo = profileDao!.convert(box);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularImage(
                      radius: 70,
                      path: _userInfo.profilePic ?? '',
                      showInitialTextAbovePicture: true,
                      initial: _userInfo.name!.substring(0, 2) ?? '',
                    ),
                    SizedBox(height: 23),
                    TextView(
                      text: _userInfo.name ?? '',
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Pallets.grey700,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Pallets.orange50),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                            text: _userInfo.referredBy ?? '',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Pallets.grey600,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () =>
                                copyToClipBoard(context, _userInfo.referredBy!),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Pallets.orange500,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextView(
                                text: 'Referral link',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Pallets.white,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48),
                TextView(
                  text: 'Package details',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                CustomTileWidget(
                  title: 'My packages',
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => PageRouter.gotoWidget(PackageScreen(), context,
                      animationType: PageTransitionType.fade),
                ),
                SizedBox(height: 32),
                TextView(
                  text: 'Profile setting',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                CustomTileWidget(
                  title: 'Basic information',
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  onTap: () => PageRouter.gotoWidget(
                      BasicInformationsScreen(_userInfo), context,
                      animationType: PageTransitionType.fade),
                ),
                CustomTileWidget(
                  title: 'Next of Kin information',
                  onTap: () {},
                ),
                CustomTileWidget(
                  title: 'Work information',
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onTap: () {},
                ),
                SizedBox(height: 32),
                TextView(
                  text: 'Finance setting',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                CustomTileWidget(
                  title: 'My bank accounts',
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  onTap: () {},
                ),
                CustomTileWidget(
                  title: 'Add bank account',
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onTap: () {},
                ),
                SizedBox(height: 32),
                TextView(
                  text: 'Security setting',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Pallets.grey500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                CustomTileWidget(
                  title: 'Change password',
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  onTap: () {},
                ),
                CustomTileWidget(
                  title: 'Change transaction pin',
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onTap: () {},
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          );
        });
  }
}
