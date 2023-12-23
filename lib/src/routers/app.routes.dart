import 'package:flutter/material.dart';
import 'package:test/src/screens/screens.dart' as screens;

class AppRoutes {
  static const initialRouter = '/auth';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/auth': (context) => const screens.AuthScreenView(),
    '/main': (context) => const screens.MainScreen(),
  };
}
