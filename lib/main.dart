import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifestyle_hub/core/network/app_config.dart';
import 'package:provider/provider.dart';

import 'core/data/session_manager.dart';
import 'database/hive_database.dart';
import 'helper/configs/instances.dart';
import 'helper/configs/providers.dart';
import 'helper/routes/routes.dart';
import 'ui/screens/dashboard/dashboard.dart';
import 'ui/screens/onboarding/splashscreen.dart';

void main() async {
  await initializeDatabase();
  await SessionManager().init();
  AppConfig.environment = Environment.staging;
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
            future: prefManager.doesExists(key: HiveBoxes.profile),
            builder: (_, AsyncSnapshot<bool> snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Container();
              }
              if (!snap.data!) {
                return SplashScreen();
              }
              return DashboardScreen();
            }),
      ),
    );
  }
}
