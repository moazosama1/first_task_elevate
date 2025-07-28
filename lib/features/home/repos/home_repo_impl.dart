import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_result/api_result.dart';
import 'package:first_task_elevate/core/api_service/reset_client.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final RestClient resetApi;
  HomeRepoImpl({required this.resetApi});
  @override
  Future<ApiResult<List<ItemCardEntities>>> fetchFeatureItems() async {
    try {
      log("trigger request");
      var request = await resetApi.getAllProduct();
      List<ItemCardEntities> items = [];
      items.addAll(request);
      return ApiResultSuccess<List<ItemCardEntities>>(data: items);
    } catch (e) {
      if (e is DioException) {
        return ApiResultError<List<ItemCardEntities>>(
            errorMessage: ServerFailure.fromDio(e));
      } else {
        return ApiResultError<List<ItemCardEntities>>(
            errorMessage: ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
