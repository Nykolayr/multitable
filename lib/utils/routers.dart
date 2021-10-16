import 'package:bart/bart/bart_model.dart';
import 'package:bart/bart/bart_scaffold.dart';
import 'package:bart/bart/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:multitable/ui/home/home.dart';
import 'package:multitable/ui/profile/profile.dart';
import 'package:multitable/ui/progress/progress.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final CustomNavigatorObserver<PageRoute> routeObserver =
    CustomNavigatorObserver<PageRoute>();

Future appPushNamed(String route, {Object? arguments}) =>
    navigatorKey.currentState!.pushNamed(route, arguments: arguments);

List<BartMenuRoute> subRoutes() {
  return [
    BartMenuRoute.bottomBar(
      label: "Home",
      icon: Icons.home,
      path: '/home',
      pageBuilder: (context, settings) => HomePage(),
    ),
    BartMenuRoute.bottomBar(
      label: "Progress",
      icon: Icons.emoji_events_outlined,
      path: '/progress',
      pageBuilder: (contextn, settings) => ProgressPage(),
    ),
    BartMenuRoute.bottomBar(
      label: "Profile",
      icon: Icons.settings,
      path: '/Profile',
      pageBuilder: (context, settings) => ProfilePage(),
    ),
  ];
}

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => MainPageMenu(routesBuilder: subRoutes));
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
