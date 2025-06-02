import 'package:first_task_elevate/features/home/presentation/home_view.dart';
import 'package:first_task_elevate/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

abstract class RoutesApp {
  static Map<String, WidgetBuilder> routeApp = {
    SplashView.routeName: (context) => SplashView(),
    HomeView.routeName: (context) => HomeView(),
  };
}
