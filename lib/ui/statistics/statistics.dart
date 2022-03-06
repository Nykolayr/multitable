// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/utils/colors.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = _homeBloc.userRepository.falseAnswer +
        _homeBloc.userRepository.trueAnswer;
    int countAll = _homeBloc.userRepository.falseAnswerAll +
        _homeBloc.userRepository.trueAnswerAll;
    if (count == 0) count = 1;
    if (countAll == 0) countAll = 1;
    context.watch<HomeBloc>();
    return Scaffold(
      backgroundColor: AppColor.meddleGrey,
      appBar: AppBarWithIcon(title: tr('statistics')),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: AppColor.gradDark, color: AppColor.darkBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getStatistics(
              title: tr('мedals'),
              widget: Column(
                children: [
                  getLineStatistic(
                    tr('мedals_all'),
                    _homeBloc.userRepository.medal.toString(),
                  ),
                ],
              ),
            ),
            getStatistics(
              title: tr('now_statistics'),
              widget: Column(
                children: [
                  getLineStatistic(
                    tr('сorrect_answers'),
                    _homeBloc.userRepository.trueAnswer.toString(),
                  ),
                  getLineStatistic(
                    tr('errors'),
                    _homeBloc.userRepository.falseAnswer.toString(),
                  ),
                  getLineStatistic(
                    tr('hints'),
                    _homeBloc.userRepository.hintCount.toString(),
                  ),
                  getLineStatistic(
                    tr('average_time'),
                    (_homeBloc.userRepository.averegeAnswer / count)
                        .toStringAsFixed(1),
                  ),
                ],
              ),
            ),
            getStatistics(
              title: tr('statistics_all'),
              widget: Column(
                children: [
                  getLineStatistic(
                    tr('сorrect_answers'),
                    _homeBloc.userRepository.trueAnswerAll.toString(),
                  ),
                  getLineStatistic(
                    tr('errors'),
                    _homeBloc.userRepository.falseAnswerAll.toString(),
                  ),
                  getLineStatistic(
                    tr('hints'),
                    _homeBloc.userRepository.hintCountAll.toString(),
                  ),
                  getLineStatistic(
                    tr('average_time'),
                    (_homeBloc.userRepository.averegeAnswerAll / countAll)
                        .toStringAsFixed(1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getLineStatistic(String title, String answer) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 2,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppText.textDarkBlue18,
        ),
        Container(),
        Text(
          answer,
          style: AppText.textRed24,
        ),
      ],
    ),
  );
}

Widget getStatistics({required String title, required Widget widget}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          title,
          style: AppText.textYellow18,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: AppColor.lightgreen,
            borderRadius: BorderRadius.circular(15),
          ),
          child: widget,
        ),
      ],
    ),
  );
}
