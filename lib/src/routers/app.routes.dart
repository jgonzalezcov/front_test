import 'package:flutter/material.dart';
import 'package:test/src/screens/screens.dart' as screens;

class AppRoutes {
  static const initialRouter = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'Home': (context) => const screens.HomeScreenView(),
  };
}
