import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverPod;
import 'package:lifestyle_hub/database/hive_database.dart';
import 'package:lifestyle_hub/helper/configs/constants.dart';
import 'package:lifestyle_hub/helper/configs/instances.dart';
import 'package:lifestyle_hub/ui/screens/dashboard/fragments/profile/profile_screen.dart';
import 'package:lifestyle_hub/utils/pallets.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'helper/configs/providers.dart';
import 'helper/routes/routes.dart';
import 'ui/screens/dashboard/dashboard.dart';
import 'ui/screens/dashboard/fragments/profile/packages/packages.dart';
import 'ui/screens/onboarding/splashscreen.dart';

void main() async {
  await initializeDatabase();
  runApp(DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => riverPod.ProviderScope(child: MyApp())));
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Pallets.orange600,
                  ),
                ),
              );
            }
            if (snapshot.hasData) {
              return PackageScreen();
            }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
