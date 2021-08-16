import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'helper/configs/providers.dart';
import 'helper/routes/routes.dart';
import 'ui/screens/onboarding/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: Providers.getProviders,
      child: MaterialApp(
        title: 'LifeStyle Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        routes: Routes.getRoutes,
        home: FutureBuilder(
          future: prefManager.getCachedData(key: AppConstants.usersPrefKey),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
