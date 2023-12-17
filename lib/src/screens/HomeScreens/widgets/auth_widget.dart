import 'package:flutter/material.dart';
import 'package:test/src/screens/HomeScreens/home_screen_model.dart';

class AuthWidget extends StatefulWidget {
  final HomeScreenModel model;

  const AuthWidget({Key? key, required this.model}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(
                fontFamily: 'Schoolbell',
                color: Colors.white,
              ), // Color del texto
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de autenticación aquí
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                widget.model.toggleAuthWidget();
              },
              child: const Text(
                '¿No tienes una cuenta? Regístrate aquí',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
