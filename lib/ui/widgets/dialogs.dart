import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/settings/bloc/settings_bloc.dart';
import 'package:multitable/ui/widgets/widgets.dart';
import 'package:multitable/utils/colors.dart';
import 'package:provider/src/provider.dart';

Future<bool> showModalBottomSheetbool(
    BuildContext context, String title, String body,
    {enableDrag = true, isDismissible = true}) async {
  return await showModalBottomSheet(
          enableDrag: enableDrag,
          isScrollControlled: true,
          isDismissible: isDismissible,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => dialog(context, title, body)) ??
      false;
}

Widget dialogLang(BuildContext context, SettingsBloc _settingsBloc) {
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
        children: [
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
          Text(
            tr('change_lang'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColor.darkBroun,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          GestureDetector(
            onTap: () async {
              await context.setLocale(const Locale("ru", "RU"));
              _settingsBloc.add(const PressLang('ru'));
              context.read<HomeBloc>().add(PressLangStat());
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.transparent,
              child: Text(
                "     " + tr('russian'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkBlue,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () async {
              await context.setLocale(const Locale("en", "US"));
              _settingsBloc.add(const PressLang('en'));
              context.read<HomeBloc>().add(PressLangStat());
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.transparent,
              child: Text(
                "     " + tr('english'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
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
