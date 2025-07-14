import 'package:first_task_elevate/core/utils/custom_button.dart';
import 'package:first_task_elevate/features/auth/presentation/view/widgets/custom_header_sign_up.dart';
import 'package:first_task_elevate/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderSignUp(),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              label: "user name",
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: "first name",
                    controller: TextEditingController(),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    label: "last name",
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              label: "email",
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: "password",
                    controller: TextEditingController(),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    label: "confirm password",
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              label: "phone",
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomMainButton(textButton: "Sign Up"),
          ],
        ),
      ),
    );
    ;
  }
}
