import 'package:first_task_elevate/core/config/di.dart';
import 'package:first_task_elevate/features/home/presentation/manager/cubit/fetch_item_cubit.dart';
import 'package:first_task_elevate/features/home/presentation/view/home_view.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';
import 'package:first_task_elevate/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RoutesApp {
  static Map<String, WidgetBuilder> routeApp = {
    SplashView.routeName: (context) => SplashView(),
    HomeView.routeName: (context) => BlocProvider(
          create: (context) => FetchItemCubit(
            homeRepo: getIt.get<HomeRepo>(),
          )..fetchItems(),
          child: HomeView(),
        ),
  };
}
