import 'package:dartz/dartz.dart';
import 'package:first_task_elevate/core/error/failure.dart';
import 'package:first_task_elevate/core/use_case/use_case_pram.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';
import 'package:first_task_elevate/features/auth/domain/repo/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase extends UseCasePram<Either<SignInResponseModel, Failure>,
    SignInRequestModel> {
  final SignInRepoContract signInRepoContract;
  SignInUseCase({required this.signInRepoContract});
  @override
  Future<Either<SignInResponseModel, Failure>> call(pram) async {
    return await signInRepoContract.signIn(info: pram);
  }
}
