import 'dart:convert';
import 'package:crypto/crypto.dart';

class AccountModel {
  int id;
  String name;
  String email;
  String hashedPassword; // Almacenaremos el password encriptado
  String condition;
  String typeAccount;
  DateTime expiration;
  String token;

  AccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.hashedPassword,
    required this.condition,
    required this.typeAccount,
    required this.expiration,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'hashedPassword': hashedPassword,
      'condition': condition,
      'typeAccount': typeAccount,
      'expiration': expiration.toIso8601String(),
      'token': token,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      hashedPassword: map['hashedPassword'],
      condition: map['condition'],
      typeAccount: map['typeAccount'],
      expiration: DateTime.parse(map['expiration']),
      token: map['token'],
    );
  }

  static String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var hashedBytes = sha256.convert(bytes);
    return hashedBytes.toString();
  }
}
