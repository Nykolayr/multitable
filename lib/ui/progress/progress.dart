import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/utils/colors.dart';
import 'package:provider/src/provider.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late HomeBloc _homeBloc;
  late Multi _multi;
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _multi = _homeBloc.multi;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomeBloc>();
    return Scaffold(
      backgroundColor: AppColor.meddleGrey,
      appBar: AppBarWithIcon(title: tr('progress')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              tr('statistics') + ' fe ${_homeBloc.userRepository.falseAnswer}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
