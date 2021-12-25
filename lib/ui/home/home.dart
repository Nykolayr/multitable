import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/widgets/app_bar.dart';
import 'package:multitable/ui/widgets/widgets.dart';
import 'package:multitable/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  getCifra(int cifra) {
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
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: Container(
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
                Container(
                  height: 20,
                  color: AppColor.yellow,
                ),
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
                  child: const Text(
                    '2*4=63',
                    style: TextStyle(
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
      ),
    );
  }
}
