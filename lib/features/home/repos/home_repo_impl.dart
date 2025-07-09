import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  Future<Either<List<ItemCardEntities>, Failure>> fetchFeatureItems() async {
    try {
      log("trigger request");
      var request = await resetApi.getAllProduct();
      List<ItemCardEntities> items = [];
      items.addAll(request);
      return left(items);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      } else {
        return right(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
