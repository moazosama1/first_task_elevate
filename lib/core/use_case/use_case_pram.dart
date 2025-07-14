import 'package:dartz/dartz.dart';
import 'package:first_task_elevate/core/error/failure.dart';

abstract class UseCasePram<Type, Pram> {
  Future<Either<Type, Failure>> call(Pram);
}
