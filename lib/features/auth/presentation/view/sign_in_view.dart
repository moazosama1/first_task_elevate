import 'package:first_task_elevate/features/auth/presentation/view/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = "SignInView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const SignInBody(),
    );
  }
}
