import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/api_service/api_service.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';
import 'package:first_task_elevate/features/home/model/item_model/item_model.dart';
import 'package:first_task_elevate/features/home/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<List<ItemCardEntities>, Failure>> fetchFeatureItems() async {
    try {
      log("trigger request");
      var request = await apiService.get();
      List<ItemCardEntities> items = [];
      request.forEach((item) {
        items.add(ItemModel.fromJson(item));
      });
      log("trigger request is success");

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
