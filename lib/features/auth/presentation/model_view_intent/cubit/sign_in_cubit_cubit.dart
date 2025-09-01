import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';
import 'package:first_task_elevate/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:first_task_elevate/features/auth/presentation/model_view_intent/cubit/sign_in_event.dart';
import 'package:meta/meta.dart';

part 'sign_in_cubit_state.dart';

class SignInCubitCubit extends Cubit<SignInCubitState> {
  SignInCubitCubit({required this.signUseCase}) : super(SignInCubitInitial());
  final SignInUseCase signUseCase;

  void doIntent(SignInEvent event) {
    switch (event) {
      case SignInRequestedEvent():
        _signIn(info: event.info);
    }
  }

  _signIn({required SignInRequestModel info}) async {
    emit(SignInCubitLoading());
    var request = await signUseCase.call(info);
    request.fold(
      (l) {
        log(l.message.toString());

        emit(SignInCubitSuccess(responseModel: l));
      },
      (r) {
        emit(SignInCubitFailure(errorMessage: r.errorMessage));
        log(r.errorMessage);
      },
    );
  }
}
