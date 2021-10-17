import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/ui/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: setAppBar(tr('training')),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 15,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 75,
                  color: greenLightColor,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
