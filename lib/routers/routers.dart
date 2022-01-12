import 'package:bart/bart/bart_model.dart';
import 'package:bart/bart/bart_scaffold.dart';
import 'package:bart/bart/bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable/domain/models/multi.dart';
import 'package:multitable/ui/home/home.dart';
import 'package:multitable/ui/home/home_cubit.dart';
import 'package:multitable/ui/profile/profile.dart';
import 'package:multitable/ui/progress/progress.dart';
import 'package:multitable/utils/colors.dart';
import 'package:multitable/utils/value.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final CustomNavigatorObserver<PageRoute> routeObserver =
    CustomNavigatorObserver<PageRoute>();

Future appPushNamed(String route, {Object? arguments}) =>
    navigatorKey.currentState!.pushNamed(route, arguments: arguments);

List<BartMenuRoute> subRoutes() {
  
  return [
    BartMenuRoute.bottomBar(
      label: tr('training'),
      icon: Icons.home,
      path: '/training',
      pageBuilder: (context, settings) => RepositoryProvider.value(
        value: userRepository,
        child: BlocProvider(
          create: (_) => HomeCubit(Multi(userRepository.step)),
          child: const HomePage(),
        ),
      ),
    ),
    BartMenuRoute.bottomBar(
      cache: true,
      label: tr('progress'),
      icon: Icons.emoji_events_outlined,
      path: '/progress',
      pageBuilder: (contextn, settings) => const ProgressPage(),
    ),
    BartMenuRoute.bottomBar(
      label: tr('profile'),
      icon: Icons.settings,
      path: '/Profile',
      pageBuilder: (context, settings) => const ProfilePage(),
    ),
  ];
}

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => const MainPageMenu(routesBuilder: subRoutes));
    default:
      throw 'unexpected Route';
  }
}

class MainPageMenu extends StatelessWidget {
  final BartRouteBuilder routesBuilder;

  const MainPageMenu({Key? key, required this.routesBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BartScaffold(
      routesBuilder: routesBuilder,
      navigatorObservers: [routeObserver],
      bottomBar: BartBottomBar.fromFactory(
        elevation: 10,
        selectedItemColor: AppColor.yellow,
        unselectedItemColor: Colors.white,
        bgColor: AppColor.darkBroun,
        bottomBarFactory: BartMaterialBottomBar.bottomBarFactory,
      ),
    );
  }
}

class CustomNavigatorObserver<T> extends RouteObserver<PageRoute<T>> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }
}
