import 'package:first_task_elevate/features/auth/api/model/sign_in_response/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  final String message;
  final String token;
  final UserModel user;

  SignInResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}