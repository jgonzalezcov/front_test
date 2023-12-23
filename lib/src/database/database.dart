import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'topic_test.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS topic(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        topic TEXT,
        user_id INTEGER,
        category TEXT,
        public BOOLEAN,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS token(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        token TEXT
      )
    ''');
  }

  // ************************** Manejo de Tabla Token ******************** //
  // Insertar o actualizar el token
  Future<int> insertOrUpdateToken(String token) async {
    final Database db = await database;
    // Verificar si ya hay un registro en la tabla de tokens
    final List<Map<String, dynamic>> result = await db.query('token');
    if (result.isNotEmpty) {
      // Si hay un registro, actualizar el token existente
      return await db.update('token', {'token': token});
    } else {
      // Si no hay un registro, insertar uno nuevo
      return await db.insert('token', {'token': token});
    }
  }

  // Obtener el token
  Future<String?> getToken() async {
    final Database db = await database;
    List<Map<String, dynamic>> tokens = await db.query('token');
    if (tokens.isNotEmpty) {
      return tokens.first['token'] as String?;
    }
    return null;
  }

// Obtener y decodificar el token
  Future<Map<String, dynamic>?> getDecodedToken() async {
    final Database db = await database;
    List<Map<String, dynamic>> tokens = await db.query('token');
    if (tokens.isNotEmpty) {
      final encodedToken = tokens.first['token'] as String?;
      if (encodedToken != null) {
        final decodedToken = JwtDecoder.decode(encodedToken);
        return decodedToken;
      }
    }
    return null;
  }

  // Eliminar el token
  Future<int> deleteToken() async {
    final Database db = await database;
    return await db.delete('token');
  }

// ************************** Manejo de Tabla Topic ******************** //

  // Insertar un nuevo topic
  Future<int> insertTopic(Map<String, dynamic> topicData) async {
    final Database db = await database;
    return await db.insert('topic', topicData);
  }

  // Obtener todos los topics
  Future<List<Map<String, dynamic>>> getAllTopics() async {
    final Database db = await database;
    return await db.query('topic');
  }

  // Obtener un topic por ID
  Future<Map<String, dynamic>?> getTopicById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('topic', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  // Actualizar un topic
  Future<int> updateTopic(int id, Map<String, dynamic> updatedData) async {
    final Database db = await database;
    return await db
        .update('topic', updatedData, where: 'id = ?', whereArgs: [id]);
  }

  // Eliminar un topic por ID
  Future<int> deleteTopic(int id) async {
    final Database db = await database;
    return await db.delete('topic', where: 'id = ?', whereArgs: [id]);
  }
}
