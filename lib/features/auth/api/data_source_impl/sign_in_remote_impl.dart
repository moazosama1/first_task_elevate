import 'dart:developer';

import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/client/rest_client_auth.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';
import 'package:first_task_elevate/features/auth/data/data_source/sign_in_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRemote)
class SignInRemoteImpl extends SignInRemote {
  final RestClientAuth restClientAuth;

  SignInRemoteImpl({required this.restClientAuth});
  @override
  Future<SignInResponseModel> signIn(SignInRequestModel info) async {
    var response = await restClientAuth.signIn(info);
    log(response.response.statusCode.toString());
    return response.data;
  }
}
