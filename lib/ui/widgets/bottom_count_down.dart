import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/dao/profile_dao.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/model/users_profile_model.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/packages/viewmodel/package_viewmodel.dart';
import 'package:lifestyle_hub/ui/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../helper/routes/navigation.dart';
import '../screens/dashboard/fragments/profile/packages/purchase_package_screen.dart';
import '../../helper/helper_handler.dart';
import '../../utils/pallets.dart';
import 'buttons.dart';
import 'glass_container.dart';
import 'text_views.dart';

class CountDownTimer {
  int? day, hour, miniute;

  CountDownTimer({
    required this.day,
    required this.hour,
    required this.miniute,
  });
}

class ButtomCountDownWidget extends StatefulWidget {
  ButtomCountDownWidget({Key? key}) : super(key: key);

  @override
  State<ButtomCountDownWidget> createState() => _ButtomCountDownWidgetState();
}

class _ButtomCountDownWidgetState extends State<ButtomCountDownWidget> {
  PackageViewmodel? _packageViewmodel;

  UsersProfileModel? _profileModel;

  void _getCatchedInfos() async {
    _profileModel = await profileDao?.convert();

    setState(() {});
  }

  @override
  void initState() {
    _packageViewmodel = Provider.of<PackageViewmodel>(context, listen: false);
    _packageViewmodel!.init(context);
    _getCatchedInfos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTrialDuration(),
        builder: (context, AsyncSnapshot<CountDownTimer> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Container();
          }
          CountDownTimer _timer = snapshot.data!;
          return Consumer<PackageViewmodel>(
            builder: (context, value, child) {
              return Visibility(
                visible:
                    _packageViewmodel!.activePackages!.isEmpty ? true : false,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GlassContainer(
                      blur: 10,
                      shadowStrength: 10,
                      opacity: 0.3,
                      border: Border.fromBorderSide(BorderSide.none),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextView(
                                          text: _timer.day!.isNegative
                                              ? '00:'
                                              : '${_timer.day}:',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          color: Pallets.red500,
                                          textAlign: TextAlign.left,
                                        ),
                                        TextView(
                                          text: 'Day',
                                          fontWeight: FontWeight.w700,
                                          color: Pallets.grey600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextView(
                                          text: _timer.day!.isNegative
                                              ? '00:'
                                              : '${_timer.hour}:',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          color: Pallets.red500,
                                          textAlign: TextAlign.left,
                                        ),
                                        TextView(
                                          text: 'Hours',
                                          fontWeight: FontWeight.w700,
                                          color: Pallets.grey600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextView(
                                          text: _timer.day!.isNegative
                                              ? '00'
                                              : '${_timer.miniute}',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 28,
                                          color: Pallets.red500,
                                          textAlign: TextAlign.left,
                                        ),
                                        TextView(
                                          text: 'Min',
                                          fontWeight: FontWeight.w700,
                                          color: Pallets.grey600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: getDeviceWidth(context) / 20),
                            Expanded(
                              child: ButtonWidget(
                                buttonText: 'Subscribe now',
                                color: Pallets.white,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontStyle: FontStyle.normal,
                                borderColor: Pallets.orange500,
                                primary: Pallets.orange500,
                                onPressed: () => _profileModel == null &&
                                        _packageViewmodel!
                                            .activePackages!.isEmpty
                                    ? PageRouter.gotoWidget(
                                        SignupScreen(), context)
                                    : PageRouter.gotoWidget(
                                        PurchasePackageScreen(), context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              );
            },
          );
        });
  }
}
