import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_service/api_service.dart';
import 'package:first_task_elevate/features/home/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

  final getIt = GetIt.instance;
   void setupLocator() {
    getIt.registerSingleton<ApiService>(
      ApiService(
        dio: Dio(),
      ),
    );
    getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
  }