import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/ui/widgets/widgets.dart';
import 'package:multitable/utils/colors.dart';
import 'package:multitable/utils/value.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Multi _multi;
  late HomeBloc _homeBloc;
  List<Color> colors = [AppColor.yellow, AppColor.green, AppColor.red];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _multi = _homeBloc.multi;
    super.initState();
  }

  getCifra(int cifra) {
    _homeBloc.add(PressCifra(cifra));
  }

  getSign(String sign) {
    if (sign == '?') {
      _homeBloc.add(PressHelp());
    } else {
      _homeBloc.add(PressDel());
    }
  }

  getEnter() {
    _homeBloc.add(PressEnter());
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomeBloc>();
    return Scaffold(
      appBar: AppBarWithIcon(
        title: tr('training'),
        isIcon: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColor.gradDark,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
              Widgets.progressBar(
                  ((_homeBloc.step * 100) / (partsList.length - 1)).floor(),
                  context),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.lightgreen,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.darkgrey,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: AppColor.darkgrey,
                      offset: Offset(0, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  '${_multi.strQuest()}${_homeBloc.userAnswer} ',
                  style: const TextStyle(
                    color: AppColor.darkgrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _multi.answer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors[_multi.status.index],
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int k = 1; k < 6; k++)
                        Expanded(
                          child: Widgets.buttonCifra(k, getCifra),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int k = 6; k < 11; k++)
                        Expanded(
                          child: Widgets.buttonCifra(k, getCifra),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Widgets.buttonSign('?', getSign),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Widgets.buttonEnter(getEnter),
                        ),
                        const SizedBox(width: 15),
                        Widgets.buttonSign('', getSign),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
