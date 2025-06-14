import 'package:flutter/material.dart';
import 'package:rashed/features/on_boarding.dart';

import '../../features/splash_screen.dart';
import '../resources/app_routes.dart';

class RouteGenerator{
  static Route? generateRoute(RouteSettings settings){
    final dynamic args = settings.arguments;
    debugPrint(args);

    switch (settings.name){

      case AppRoutes.splash:
        return _screenRedirect(const SplashScreen());

      case AppRoutes.onBoarding:
        return _screenRedirect(const OnBoarding());

      default:
        return _errorRoute();

    }
  }

  static MaterialPageRoute<dynamic> _screenRedirect(Widget screen) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No Route Found'),
        ),
      );
    });
  }
}
