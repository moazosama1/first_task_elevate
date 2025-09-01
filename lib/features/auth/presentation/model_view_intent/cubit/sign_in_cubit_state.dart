part of 'sign_in_cubit_cubit.dart';

@immutable
sealed class SignInCubitState {}

final class SignInCubitInitial extends SignInCubitState {}

final class SignInCubitSuccess extends SignInCubitState {
  final SignInResponseModel responseModel;

  SignInCubitSuccess({required this.responseModel});
}

final class SignInCubitLoading extends SignInCubitState {}

final class SignInCubitFailure extends SignInCubitState {
  final String errorMessage;

  SignInCubitFailure({required this.errorMessage});
}
