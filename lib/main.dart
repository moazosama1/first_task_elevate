import 'package:first_task_elevate/core/utils/routes_app.dart';
import 'package:first_task_elevate/core/utils/service_locator.dart';
import 'package:first_task_elevate/core/utils/theme_app.dart';
import 'package:first_task_elevate/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  // Bloc.observer = 
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.theme,
      initialRoute: SplashView.routeName,
      routes: RoutesApp.routeApp,
    );
  }
}
