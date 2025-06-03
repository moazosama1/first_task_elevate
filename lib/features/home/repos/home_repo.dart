import 'package:dartz/dartz.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/features/home/entities/item_card_entities.dart';

abstract class HomeRepo {
  Future<Either<List<ItemCardEntities>, Failure>> fetchFeatureItems();
}
