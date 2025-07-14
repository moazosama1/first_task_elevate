
import 'package:dio/dio.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_response/sign_in_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client_auth.g.dart';

@injectable
@RestApi()
abstract class RestClientAuth {
  @factoryMethod
  factory RestClientAuth(
    @Named("auth") Dio dio,
  ) = _RestClientAuth;

  @POST("signin")
  Future<HttpResponse<SignInResponseModel>> signIn(
    @Body() SignInRequestModel request,
  );
}
