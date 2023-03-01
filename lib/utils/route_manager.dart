import 'package:flutter/material.dart';
import 'package:workout_log/utils/strings_manager.dart';
import 'package:workout_log/view/auth/login_screen.dart';
import 'package:workout_log/view/auth/sign_up_screen.dart';
import 'package:workout_log/view/dashboard/dashboard_screen.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String dashboardRoute = "/dashboard";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}