import 'package:first_task_elevate/core/config/di.dart';
import 'package:first_task_elevate/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:first_task_elevate/features/auth/presentation/view/sign_in_view.dart';
import 'package:first_task_elevate/features/auth/presentation/view/sign_up_view.dart';
import 'package:first_task_elevate/features/auth/presentation/view_model/cubit/sign_in_cubit_cubit.dart';
import 'package:first_task_elevate/features/home/presentation/manager/cubit/fetch_item_cubit.dart';
import 'package:first_task_elevate/features/home/presentation/view/home_view.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';
import 'package:first_task_elevate/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RoutesApp {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case "splashView":
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case "homeView":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => FetchItemCubit(
                homeRepo: getIt.get<HomeRepo>(),
              )..fetchItems(),
              child: HomeView(),
            );
          },
        );
      case "SignInView":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignInCubitCubit(
              signUseCase: getIt.get<SignInUseCase>(),
            ),
            child: SignInView(),
          ),
        );
      case "SignUpView":
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
