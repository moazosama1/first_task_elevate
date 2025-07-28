import 'package:first_task_elevate/core/error/failure.dart';

sealed class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;

  ApiResultSuccess({required this.data});
}

class ApiResultError<T> extends ApiResult<T> {
  final Failure errorMessage;

  ApiResultError({required this.errorMessage});
}
