import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multitable/utils/colors.dart';

class Widgets {
  static Widget buttonCifra(int cifra, Function callBack) {
    if (cifra == 10) cifra = 0;
    return GestureDetector(
      onTap: () => callBack(cifra),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 58,
        decoration: BoxDecoration(
          gradient: AppColor.gradDark,
          borderRadius: BorderRadius.circular(10),
          border: AppColor.border,
        ),
        alignment: Alignment.center,
        child: Text(
          '$cifra',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static Widget buttonSign(String sign, Function callBack) {
    return GestureDetector(
      onTap: () => callBack(sign),
      child: Container(
        height: 58,
        width: 75,
        decoration: BoxDecoration(
          gradient: AppColor.gradBlue,
          borderRadius: BorderRadius.circular(10),
          border: AppColor.border,
        ),
        alignment: Alignment.center,
        child: (sign == '')
            ? SvgPicture.asset(
                "assets/icon/delete.svg",
                height: 16,
                color: Colors.white,
              )
            : Text(
                sign,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  static Widget buttonEnter(Function callBack) {
    return GestureDetector(
      onTap: () => callBack('enter'),
      child: Container(
        height: 58,
        width: 58,
        decoration: BoxDecoration(
          gradient: AppColor.gradRed,
          borderRadius: BorderRadius.circular(10),
          border: AppColor.border,
        ),
        alignment: Alignment.center,
        child: const Text(
          'Проверить',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
