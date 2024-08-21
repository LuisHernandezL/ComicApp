import 'package:flutter/material.dart';
import 'package:comic_vine_app/screens/screens.dart';
import 'package:comic_vine_app/widget/custom_appbar.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ComicScreen.routeName:
        return ComicScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(),
        ),
        body: Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
