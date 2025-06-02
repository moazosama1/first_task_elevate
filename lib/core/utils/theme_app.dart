import 'package:flutter/material.dart';

class ThemeApp {
  static var theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xff003b84),
      primary: Color(0xff003b84),
      surface: Colors.black,
      onSurface: Colors.white,
    ),
  );
}
