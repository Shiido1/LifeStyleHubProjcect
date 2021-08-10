import 'package:flutter/material.dart';
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
    return MultiProvider(
      providers: Providers.getProviders,
      child: MaterialApp(
        title: 'LifeStyle Hub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Routes.getRoutes,
        home: SplashScreen(),
      ),
    );
  }
}
