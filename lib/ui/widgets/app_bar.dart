import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multitable/utils/colors.dart';

class AppBarWithIcon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? clickButton;
  final String pathSvg;
  final bool isBack;
  final bool isIcon;
  const AppBarWithIcon({
    Key? key,
    required this.title,
    this.clickButton,
    this.pathSvg = '',
    this.isBack = false,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          isBack
              ? GestureDetector(
                  onTap: clickButton,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.transparent,
                    height: 30,
                    width: 40,
                    child: SvgPicture.asset(
                      "assets/icon/arrow_left.svg",
                      width: 8,
                      height: 20,
                      fit: BoxFit.none,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      actions: [
        isIcon
            ? GestureDetector(
                onTap: clickButton,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.transparent,
                  child: CircleAvatar(
                    radius: 16,
                    child: SvgPicture.asset(
                      "assets/icon/user.svg",
                      width: 20,
                      height: 20,
                      fit: BoxFit.none,
                      color: AppColor.darkBroun,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.darkBroun,
    );
  }
}
