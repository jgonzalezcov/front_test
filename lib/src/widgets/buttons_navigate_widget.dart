import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/src/providers/navigate_provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // Obtén la instancia del provider
    var navigateProvider =
        Provider.of<NavigateProvider>(context, listen: false);

    setState(() {
      _selectedIndex = index;

      // Cambiar el valor de _viewScreen (Provider) según el índice seleccionado
      switch (_selectedIndex) {
        case 0:
          navigateProvider.setStringValue('home');
          break;
        case 1:
          navigateProvider.setStringValue('add');
          break;
        case 2:
          navigateProvider.setStringValue('search');
          break;
        case 3:
          navigateProvider.setStringValue('profile');
          break;
        case 4:
          navigateProvider.setStringValue('config');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Nuevo Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cuenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
            label: 'Carga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: const Color.fromARGB(255, 79, 79, 79),
        onTap: _onItemTapped,
      ),
    );
  }
}
