import 'package:first_task_elevate/core/utils/custom_button.dart';
import 'package:first_task_elevate/features/auth/api/model/sign_in_request/sign_in_request_model.dart';
import 'package:first_task_elevate/features/auth/presentation/view/sign_up_view.dart';
import 'package:first_task_elevate/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:first_task_elevate/features/auth/presentation/model_view_intent/cubit/sign_in_cubit_cubit.dart';
import 'package:first_task_elevate/features/auth/presentation/model_view_intent/cubit/sign_in_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign in",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              label: "email",
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInCubitCubit, SignInCubitState>(
              builder: (context, state) {
                switch (state) {
                  case SignInCubitInitial():
                    return Text("initial");
                  case SignInCubitSuccess():
                    return Text(state.responseModel.message);
                  case SignInCubitLoading():
                    return CircularProgressIndicator();
                  case SignInCubitFailure():
                    return Text(state.errorMessage);
                }
              },
            ),
            CustomTextField(
              label: "password",
              controller: passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
                  child: Text(
                    "Sign Up",
                  )),
            ),
            CustomMainButton(
              textButton: "Sign In",
              onTap: () {
                BlocProvider.of<SignInCubitCubit>(context)
                    .doIntent(SignInRequestedEvent(
                  info: SignInRequestModel(
                      email: emailController.text,
                      password: passwordController.text),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
