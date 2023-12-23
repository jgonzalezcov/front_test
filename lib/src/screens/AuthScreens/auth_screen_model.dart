import 'package:stacked/stacked.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/src/database/database.dart';
import 'package:test/src/providers/token_provider.dart';

class AuthScreenModel extends BaseViewModel {
  bool _showAuthWidget = true;
  bool get showAuthWidget => _showAuthWidget;
  String _showMessage = '';
  String get showMessage => _showMessage;
  String urlBase = 'https://backendtest-production-c7b9.up.railway.app/account';
  int timeMessage = 2;
  void toggleAuthWidget() {
    _showAuthWidget = !_showAuthWidget;
    notifyListeners();
  }

  void messageAlertWidget(String message) {
    _showMessage = message;
    notifyListeners();
    Future.delayed(Duration(seconds: timeMessage), () {
      _showMessage = '';
      notifyListeners();
    });
  }

//Validacion de formato de correo
  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void messageFuntion(String message) {
    _showMessage = message;
    notifyListeners();
    Future.delayed(Duration(seconds: timeMessage), () {
      _showMessage = '';
      notifyListeners();
    });
  }

//Validacion de campos
  Future<void> registerUser(String email, String password, String name,
      String passwordConfirm) async {
    if (email == '' || password == '' || name == '' || passwordConfirm == '') {
      messageFuntion('Debes ingresar todos los campos');
    } else if (!isValidEmail(email)) {
      messageFuntion('Formato de correo electrónico inválido');
    } else if (password != passwordConfirm) {
      messageFuntion('Las contraseñas ingresadas no coinciden');
    } else {
      final url = Uri.parse('$urlBase/signin');

      final Map<String, String> data = {
        'email': email.toLowerCase(),
        'password': password,
        'name': name.toLowerCase(),
      };

      final response = await http.post(
        url,
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        _showAuthWidget = true;
        messageFuntion('La cuenta fue creada correctamente');
      } else {
        _showAuthWidget = false;
        messageFuntion('Error al crear la cuenta: ${response.statusCode}');
      }
    }
  }

// Ingreso de usuario
  Future<void> authenticate(String email, String password) async {
    final url = Uri.parse(
        'https://backendtest-production-c7b9.up.railway.app/account/login');
    final Map<String, String> data = {
      'email': email.toLowerCase(),
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        _showAuthWidget = true;
        messageFuntion('Autenticación exitosa');
        final String token = response.body;
        await DatabaseHelper().insertOrUpdateToken(token);
        await TokenProvider().updateDecodedToken(token);
      } else {
        messageFuntion('Error de autenticación');
      }
    } catch (error) {
      messageFuntion('Error de conexión: $error');
    }
  }
}
