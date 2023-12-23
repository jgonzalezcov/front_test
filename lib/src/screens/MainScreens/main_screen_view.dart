import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/src/providers/navigate_provider.dart';
import 'package:test/src/screens/AddScreens/add_screen_view.dart';
import 'package:test/src/screens/ConfigScreens/config_screen_view.dart';
import 'package:test/src/screens/HomeScreens/home_screen_view.dart';
import 'package:test/src/screens/ProfileScreens/profile_screen_view.dart';
import 'package:test/src/screens/SearchScreens/search_screen_view.dart';
import 'package:test/src/widgets/buttons_navigate_widget.dart';
import 'package:test/src/widgets/title_text/title_text_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Lista de mapas que asocian el valor de NavigateProvider con el widget correspondiente
  final List<Map<String, Widget>> widgetMappings = [
    {'home': const HomeScreen()},
    {'add': const AddScreen()},
    {'search': const SearchScreen()},
    {'profile': const ProfileScreen()},
    {'config': const ConfigScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 63, 113),
      body: SafeArea(
        child: Column(
          children: [
            const Hero(
              tag: 'titleTextHero',
              child: TitleTextWidget(
                sizeFont: 28,
                alingText: Alignment.topLeft,
                textIndentation: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  Consumer<NavigateProvider>(
                    builder: (context, navigateProvider, child) {
                      // Accede al valor de NavigateProvider
                      String viewScreen = navigateProvider.getViewScreen;

                      // Busca el widget correspondiente en la lista
                      Widget? selectedWidget = widgetMappings.firstWhere(
                          (map) => map.keys.first == viewScreen,
                          orElse: () =>
                              {viewScreen: const SizedBox()})[viewScreen];

                      // Usa el valor para decidir qué widget mostrar
                      return Visibility(
                        visible: viewScreen.isNotEmpty,
                        child: selectedWidget ?? const SizedBox(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const BottomNavigationWidget(),
          ],
        ),
      ),
    );
  }
}
