import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/navigator.dart';
import 'core/resources/app_routes.dart';
import 'core/utils/route_generator.dart';

class Rashed extends StatelessWidget {
  const Rashed({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(660, 1355),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rashed',
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,

          initialRoute: AppRoutes.splash,
          onGenerateRoute: RouteGenerator.generateRoute,

          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
