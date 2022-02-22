import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/ui/widgets/widgets.dart';
import 'package:multitable/utils/colors.dart';

Future<bool> showModalBottomSheetbool(
    BuildContext context, String title, String body,
    {enableDrag = true, isDismissible = true}) async {
  return await showModalBottomSheet(
      enableDrag: enableDrag,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => dialog(context, title, body));
}

Widget dialog(BuildContext context, String title, String body) {
  return Container(
    color: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
      decoration: const BoxDecoration(
        borderRadius: AppColor.borderRadiusTop15,
        color: AppColor.lightgreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Container(
              width: 72,
              height: 4,
              color: AppColor.darkgrey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: AppColor.redDark,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            body,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Widgets.buttonDialog(tr('no'), (String answer) {
                Navigator.pop(context, false);
              }),
              Widgets.buttonDialog(tr('yes'), (String answer) {
                Navigator.pop(context, true);
              }),
            ],
          ),
        ],
      ),
    ),
  );
}
