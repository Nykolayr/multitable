import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/routers/routers.dart';
import 'package:multitable/ui/home/bloc/home_bloc.dart';
import 'package:multitable/utils/value.dart';

import 'domain/repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  userRepository = await UserRepository.create();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru', 'RU'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      startLocale: const Locale('ru', 'RU'),
      child: RepositoryProvider(
        create: (context) => userRepository,
        child: BlocProvider(
          create: (_) => HomeBloc(userRepository),
          child: const MyApp(),
        ),
      ),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    context.watch<HomeBloc>();
    print('object === main');
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
