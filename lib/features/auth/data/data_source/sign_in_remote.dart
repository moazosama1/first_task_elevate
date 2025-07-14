import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';

abstract class SignInRemote {
  Future<SignInResponseModel> signIn(SignInRequestModel info);
}
