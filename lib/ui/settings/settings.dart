import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multitable/ui/settings/bloc/settings_bloc.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/ui/widgets/dialogs.dart';
import 'package:multitable/ui/widgets/widgets.dart';
import 'package:multitable/utils/colors.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc _settingsBloc;
  @override
  void initState() {
    _settingsBloc = context.read<SettingsBloc>();
    super.initState();
  }

  setSound() {
    _settingsBloc.add(PressSound());
  }

  @override
  Widget build(BuildContext context) {
    context.watch<SettingsBloc>();
    return Scaffold(
      backgroundColor: AppColor.meddleGrey,
      appBar: AppBarWithIcon(
        title: tr('settings'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: AppColor.gradDark, color: AppColor.darkBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 36,
            ),
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => dialogLang(context, _settingsBloc),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('lang'),
                      style: const TextStyle(
                          color: AppColor.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          _settingsBloc.lang + '   ',
                          style: const TextStyle(
                              color: AppColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SvgPicture.asset('assets/icon/arrow_right.svg',
                            height: 14, color: AppColor.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Widgets.lineSwitch(
              title: tr('sound'),
              body: '',
              isSwitch: _settingsBloc.isSound,
              setSwitch: setSound,
            ),
          ],
        ),
      ),
    );
  }
}
