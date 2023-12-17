import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/src/routers/app.routes.dart';
import 'package:test/src/providers/view_state_provider.dart';
import 'package:test/src/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ViewStateProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRouter,
          routes: AppRoutes.routes,
          title: 'Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home: const HomeScreenView(),
        ));
  }
}
