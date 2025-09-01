import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';

sealed class SignInEvent {}

class SignInRequestedEvent extends SignInEvent {
  final SignInRequestModel info;

  SignInRequestedEvent({required this.info});
}
