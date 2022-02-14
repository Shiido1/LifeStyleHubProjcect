import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/onboarding/viewmodel/tab_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../../../database/hive_database.dart';
import '../../../bank/account/add_bank_screen.dart';
import 'model/users_profile_model.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../helper/configs/instances.dart';
import '../../../../../helper/helper_handler.dart';
import '../../../../../helper/routes/navigation.dart';
import '../../../../../utils/image_picker.dart';
import '../../../../../utils/pallets.dart';
import '../../../../widgets/image_loader.dart';
import '../../../../widgets/text_views.dart';
import 'basic_informations.dart';
import 'change_password_screen.dart';
import 'dao/profile_dao.dart';
import 'my_bank.dart';
import 'next_of_kin_information.dart';
import 'packages/packages.dart';
import 'viewmodel/profile_viewmodel.dart';
import 'widget/custom_tile.dart';
import 'work_information.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ignore: unused_field
  TabViewModel? _tabViewModel;
  ProfileViewmodel? _profileViewmodel;

  @override
  void initState() {
    _getCatchedInfos();
    _tabViewModel = Provider.of<TabViewModel>(context, listen: false);
    _profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    _profileViewmodel!.init(context);
    _profileViewmodel!.getUsersProfile();
    super.initState();
  }

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao?.convert();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _getCatchedInfos();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _file != null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(_file!),
                    )
                  : CircularImage(
                      onTap: () => _pickImages(),
                      radius: 70,
                      path: _profileModel?.profilePic ?? '',
                      initial: _profileModel?.profilePic == null
                          ? _profileModel?.name?.substring(0, 1)
                          : '',
                      showInitialTextAbovePicture: true,
                    ),
              SizedBox(height: 23),
              TextView(
                text: _profileModel?.name ?? '',
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: Pallets.grey700,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              SizedBox(height: 16),
              Container(
                width: getDeviceWidth(context) / 2,
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallets.orange50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextView(
                        text: _profileModel?.affiliateId?.link ?? '',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Pallets.grey600,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => copyToClipBoard(
                          context, _profileModel?.affiliateId?.link ?? ''),
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
          // TextView(
          //   text: 'Package details',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          //   color: Pallets.grey500,
          //   textAlign: TextAlign.left,
          // ),
          // SizedBox(height: 16),
          CustomTileWidget(
            visibility: _profileModel?.role == "user",
            titleText: 'Package details',
            title: 'My packages',
            borderRadius: BorderRadius.circular(10),
            onTap: () => PageRouter.gotoWidget(PackageScreen(), context,
                animationType: PageTransitionType.fade),
          ),
          SizedBox(height: 32),
          // TextView(
          //   text: 'Profile setting',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 16,
          //   color: Pallets.grey500,
          //   textAlign: TextAlign.left,
          // ),
          // SizedBox(height: 16),
          CustomTileWidget(
            titleText: 'Profile setting',
            title: 'Basic information',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            onTap: () => PageRouter.gotoWidget(
                BasicInformationsScreen(), context,
                animationType: PageTransitionType.fade),
          ),
          CustomTileWidget(
            visibility: _profileModel?.role == "user",
            title: 'Next of Kin information',
            onTap: () => PageRouter.gotoWidget(
                NextOfKinInformationScreen(), context,
                animationType: PageTransitionType.fade),
          ),
          CustomTileWidget(
            visibility: _profileModel?.role == "user",
            title: 'Work information',
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            onTap: () => PageRouter.gotoWidget(
                WorkInformationScreen(_profileModel?.work), context,
                animationType: PageTransitionType.fade),
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
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            onTap: () => PageRouter.gotoWidget(BankListScreen(), context,
                animationType: PageTransitionType.fade),
          ),
          CustomTileWidget(
            visibility: _profileModel?.role == "user",
            title: 'Add bank account',
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            onTap: () => PageRouter.gotoWidget(
                AddOrEditBankAccountScreen(), context,
                animationType: PageTransitionType.fade),
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
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            onTap: () => PageRouter.gotoWidget(ChangePasswordScreen(), context,
                animationType: PageTransitionType.fade),
          ),
          // CustomTileWidget(
          //   title: 'Change transaction pin',
          //   borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(10),
          //       bottomRight: Radius.circular(10)),
          //   onTap: () => PageRouter.gotoWidget(ChangePINScreen(), context,
          //       animationType: PageTransitionType.fade),
          // ),
          CustomTileWidget(
            title: 'Log out',
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            onTap: () => HiveBoxes.logOut(context),
          ),
          SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }

  final _image = ImagePickerHandler();

  File? _file;

  Future<FormData> _getMappedData() async {
    String fileName = _file!.path.split('/').last;
    return FormData.fromMap({
      'profile_pic':
          await MultipartFile.fromFile(_file!.path, filename: fileName),
      '_method': 'PATCH',
    });
  }

  void _pickImages() async {
    try {
      _image.pickImage(
          context: context,
          file: (file) async {
            _file = file;
            await _profileViewmodel!.updateUsersProfile(await _getMappedData());
            _getCatchedInfos();
            setState(() {});
          });
    } catch (e) {
      logger.e(e);
    }
  }
}
