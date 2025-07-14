import 'package:dartz/dartz.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';

abstract class SignInRepoContract {
  Future<Either<SignInResponseModel, Failure>> signIn(
      {required SignInRequestModel info});
}
