import 'package:flutter/material.dart';
import 'package:test/src/screens/HomeScreens/home_screen_model.dart';

class SignInWidget extends StatefulWidget {
  final HomeScreenModel model;

  const SignInWidget({Key? key, required this.model}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllerConfirm =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: _nameController,
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
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
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
            const SizedBox(height: 16.0),
            TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: _passwordControllerConfirm,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Ingresa nuevamente tu Contraseña',
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
                widget.model.registerUser(
                  _emailController.text,
                  _passwordController.text,
                  _nameController.text,
                  _passwordControllerConfirm.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Crear Cuenta',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.model.toggleAuthWidget();
              },
              child: const Text(
                '¿Ya dispones de una cuenta? Ingresa aquí',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
