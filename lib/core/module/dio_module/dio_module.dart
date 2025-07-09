import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_service/api_url.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          baseUrl: ApiUrls.url,
        ),
      );
}
