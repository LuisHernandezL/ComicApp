import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comic_vine_app/repositories/repositories.dart';
import 'package:comic_vine_app/screens/screens.dart';
import 'package:comic_vine_app/utils/variable_static.dart';
import '/blocs/blocs.dart';
import 'config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ComicBloc(
            comicsRepository: ComicsRepository(),
          )..add(LoadComic()),
        ),
        BlocProvider(
          create: (_) => ComicDetailBloc(
            comicsRepository: ComicDetailRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'ComicVineApp',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        scaffoldMessengerKey: NavigationService.navigatorKey,
        home: const HomeScreen(),
      ),
    );
  }
}
