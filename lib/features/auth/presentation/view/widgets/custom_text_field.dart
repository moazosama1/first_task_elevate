import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.validation,
      required this.controller});
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: Colors.blueAccent,
      validator: validation,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 18),
        disabledBorder: customStyleBorderTextFiled(
          color: Colors.black,
        ),
        enabledBorder: customStyleBorderTextFiled(
          color: Colors.black,
        ),
        border: customStyleBorderTextFiled(
          color: Colors.black,
        ),
        focusedBorder: customStyleBorderTextFiled(
          color: Colors.black,
        ),
        errorBorder: customStyleBorderTextFiled(
          color: Colors.red,
        ),
      ),
    );
  }

  OutlineInputBorder customStyleBorderTextFiled({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
