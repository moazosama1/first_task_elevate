import 'package:flutter/material.dart';

class CustomHeaderSignUp extends StatelessWidget {
  const CustomHeaderSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        Text(
          "Sign up",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ],
    );
  }
}
