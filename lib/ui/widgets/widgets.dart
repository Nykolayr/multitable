import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multitable/utils/colors.dart';

class Widgets {
  static Widget progressBar(int procent, BuildContext context) {
    return Container(
      color: AppColor.yellow,
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            color: AppColor.red,
            width: (MediaQuery.of(context).size.width - 50) * (procent / 100),
          ),
          Align(
            child: Text(
              '$procent%',
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: (procent < 51) ? AppColor.darkgrey : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

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

  static Widget iconAction(String sign, Function callBack) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 8, top: 8, bottom: 8),
        color: Colors.transparent,
        child: CircleAvatar(
          radius: 16,
          child: SvgPicture.asset(
            sign,
            width: 20,
            height: 20,
            fit: BoxFit.fill,
            color: AppColor.darkBroun,
          ),
          backgroundColor: Colors.white,
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
      onTap: () => callBack(),
      child: Container(
        height: 58,
        width: 58,
        decoration: BoxDecoration(
          gradient: AppColor.gradRed,
          borderRadius: BorderRadius.circular(10),
          border: AppColor.border,
        ),
        alignment: Alignment.center,
        child: Text(
          tr('check'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
