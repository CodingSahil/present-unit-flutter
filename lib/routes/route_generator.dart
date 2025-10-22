import 'package:flutter/material.dart';
import 'package:present_unit_flutter/routes/routes.dart';
import 'package:present_unit_flutter/view/splash_view.dart';

class RouteGenerator {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
