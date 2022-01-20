import 'package:flutter/material.dart';

class AppColor {
  static const Color darkBroun = Color(0xFF4B0505);
  static const Color yellow = Color(0xFFFAEA0D);
  static const Color lightgreen = Color(0xFFB8C6A3);
  static const Color red = Color(0xFFA61E1E);
  static const Color grey = Color(0xFFD9DADA);
  static const Color lightBlue = Color(0xFF7599C5);
  static const Color darkBlue = Color(0xFF031542);
  static const Color meddleGrey = Color(0xFF5A5954);
  static const Color darkgrey = Color(0xFF050505);
  static const Color redDark = Color(0xFF470404);
  static const Color green = Color(0xFF5FB56A);
  static const LinearGradient gradDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [darkgrey, meddleGrey],
  );
  static const LinearGradient gradBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lightBlue, darkBlue],
  );
  static const LinearGradient gradRed = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [red, redDark],
  );
  static Border border = Border.all(width: 1, color: meddleGrey);
}
