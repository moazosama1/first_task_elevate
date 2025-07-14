import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';
import 'package:first_task_elevate/features/auth/data/data_source/sign_in_remote.dart';
import 'package:first_task_elevate/features/auth/domain/repo/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepoContract)
class SignInRepoImpl extends SignInRepoContract {
  final SignInRemote signInRemote;

  SignInRepoImpl({required this.signInRemote});
  @override
  Future<Either<SignInResponseModel, Failure>> signIn(
      {required SignInRequestModel info}) async {
    try {
      var request = await signInRemote.signIn(info);
      return left(request);
    } on DioException catch (e) {
      return right(ServerFailure.fromDio(e));
    } catch (e) {
      return right(ServerFailure(errorMessage: e.toString()));
    }
  }
}
