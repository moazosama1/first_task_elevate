import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_service/api_url.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  get() async {
    var response = await dio.get(ApiUrls.url);
    return response.data;
  }
}
