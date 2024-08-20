import 'package:comic_vine_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    // GoRoute(
    //   path: '/',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoadingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: 'Home',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const HomeScreen();
    //   },
    // ),
  ],
);
