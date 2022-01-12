import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multitable/ui/widgets/widgets.dart';
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
      actions: isIcon
          ? [
              Widgets.iconAction("assets/icon/restart.svg", () => {}),
              Widgets.iconAction("assets/icon/user.svg", () => {}),
            ]
          : [],
      elevation: 5,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.darkBroun,
    );
  }
}
