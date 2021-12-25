import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/utils/colors.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.meddleGrey,
      appBar: AppBarWithIcon(title: tr('progress')),
      body: const Text('profile'),
    );
  }
}
