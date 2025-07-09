import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_service/api_url.dart';

import 'package:first_task_elevate/features/home/model/item_model/item_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'reset_client.g.dart';

@injectable
@RestApi()
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  @GET(ApiUrls.endPoint)
  Future<List<ItemModel>> getAllProduct();
}
