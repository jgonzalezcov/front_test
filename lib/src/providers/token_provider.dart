import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart'; // Importa la librería jwt_decoder

class TokenProvider with ChangeNotifier {
  Map<String, dynamic> _decodedToken = {};
  Map<String, dynamic> get decodedToken => _decodedToken;

  Future<void> updateDecodedToken(String token) async {
    try {
      // Decodificar el token con jwt_decoder
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      _decodedToken = decodedToken;

      notifyListeners();
    } catch (error) {
      // Manejar el error según tus necesidades
    }
  }
}
