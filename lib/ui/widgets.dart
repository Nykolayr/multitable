import 'package:flutter/material.dart';
import 'package:multitable/utils/colors.dart';

AppBar setAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    leading: const SizedBox.shrink(),
    elevation: 5,
    backgroundColor: bottomBar,
  );
}
