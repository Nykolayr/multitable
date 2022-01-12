import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/ui/home/home_cubit.dart';
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
  @override
  void initState() {
    super.initState();
  }

  getCifra(int cifra) {
    context.read<HomeCubit>().emit();
    if (kDebugMode) {
      print('console $cifra');
    }
  }

  getSign(String sign) {
    if (kDebugMode) {
      print('console $sign');
    }
  }

  getEnter(String sign) {
    if (kDebugMode) {
      print('console enter');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithIcon(
        title: tr('training'),
        clickButton: () {},
        isIcon: true,
      ),
      body: BlocBuilder<HomeCubit, Multi>(
        builder: (context, multi) => Container(
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
                Widgets.progressBar(
                    ((userRepository.step * 100) / (partsList.length - 1))
                        .floor(),
                    context),
                const SizedBox(
                  height: 20,
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
                    '${multi.strQuest()} ${multi.userAnswer} ',
                    style: const TextStyle(
                      color: AppColor.darkgrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 52,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(
                  height: 30,
                  child: Text(
                    'Внимание',
                    style: TextStyle(
                      color: AppColor.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int k = 1; k < 6; k++)
                          Expanded(
                            child: Widgets.buttonCifra(
                                k, context.read<HomeCubit>().emit(state.a)),
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
      ),
    );
  }
}
