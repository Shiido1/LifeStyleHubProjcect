import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../helper/helper_handler.dart';
import '../../../helper/routes/navigation.dart';
import '../../../helper/routes/routes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/image_loader.dart';
import '../../widgets/text_views.dart';
import '../../../utils/images.dart';
import '../../../utils/pallets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.orange600,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppImages.curves)),
          SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 44.5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: getDeviceHeight(context) / 4,
                    ),
                    ImageLoader(
                      height: 120,
                      width: 120,
                      path: AppImages.logo,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextView(
                      text: 'Lifestyle Hub',
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Pallets.white,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 79.5,
                    ),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Signup now',
                      color: Pallets.grey800,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.white,
                      onPressed: () =>
                          PageRouter.gotoNamed(Routes.signup, context),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonWidget(
                      width: getDeviceWidth(context),
                      buttonText: 'Login',
                      color: Pallets.white,
                      borderColor: Pallets.white,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      fontStyle: FontStyle.normal,
                      primary: Pallets.orange600,
                      onPressed: () =>
                          PageRouter.gotoNamed(Routes.login, context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
