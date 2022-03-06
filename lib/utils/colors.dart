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
  static const BorderRadius borderRadiusTop15 = BorderRadius.vertical(
    top: Radius.circular(15),
  );
}

class AppText {
  static const TextStyle textYellow30 = TextStyle(
    color: AppColor.yellow,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static const TextStyle textYellow18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.yellow,
  );
  static const TextStyle textDarkBlue18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.darkBlue,
  );
  static const TextStyle textRed24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.red,
  );
  static const TextStyle textWhite18 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );
  static const TextStyle textDarkgrey50 = TextStyle(
    color: AppColor.darkgrey,
    fontWeight: FontWeight.bold,
    fontSize: 50,
  );
  static const TextStyle textWhite42 = TextStyle(
    color: Colors.white,
    fontSize: 42,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textWhite22 = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}
