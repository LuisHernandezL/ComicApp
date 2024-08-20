import 'package:comic_vine_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [],
        //   child:
        MaterialApp.router(
      title: 'ComicVine App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
    // );
  }
}
