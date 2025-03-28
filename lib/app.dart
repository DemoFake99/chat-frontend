import 'package:flutter/material.dart';

import 'core/constant/themes.dart';
import 'core/router/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "A-Chat",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routerConfig: RouteManager.route,
    );
  }
}
