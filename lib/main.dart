import 'package:comic_vine_app/config/config.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:comic_vine_app/app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  print(Env.baseUrl);

  return runApp(const MyApp());
}
