import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:multitable/repository/userRepository.dart';
import 'package:multitable/utils/routers.dart';
import 'package:multitable/utils/value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  userRepository = await UserRepository.create();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ru', 'RU'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: Locale('ru', 'RU'),
      startLocale: Locale('ru', 'RU'),
      child: MyApp(
        userRepository: userRepository,
      )));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'multitable',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(),
      onGenerateRoute: routes,
      navigatorObservers: [routeObserver],
    );
  }
}
