import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test/src/models/local/topic_model.dart';

class DatabaseTopicHelper {
  static final DatabaseTopicHelper instance = DatabaseTopicHelper._();
  static Database? _database;

  DatabaseTopicHelper._();

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
    // Agrega la tabla para almacenar el token
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
    Database db = await database;
    List<Map<String, dynamic>> tokens = await db.query('token');
    if (tokens.isNotEmpty) {
      return tokens.first['token'] as String?;
    }
    return null;
  }

  // Eliminar el token
  Future<int> deleteToken() async {
    Database db = await database;
    return await db.delete('token');
  }

// ************************** Manejo de Tabla Topic ******************** //
//inserta los temas de estudios
  Future<int> insertTopic(TopicModelLocal topics) async {
    Database db = await database;
    return await db.insert('topic', topics.toMap());
  }

//lee los temas de estudios
  Future<List<TopicModelLocal>> getTopics() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('topic');
    return List.generate(maps.length, (index) {
      return TopicModelLocal(
          id: maps[index]['id'],
          topic: maps[index]['topic'],
          userId: maps[index]['user_id'],
          category: maps[index]['category'],
          isPublic: maps[index]['isPublic'],
          description: maps[index]['description']);
    });
  }

//actualiza los temas de estudios por id
  Future<int> updateTopic(topic) async {
    Database db = await database;
    return await db.update(
      'topic',
      topic.toMap(),
      where: 'id = ?',
      whereArgs: [topic.id],
    );
  }

  //elimina los temas de estudios po id
  Future<int> deleteTopic(int id) async {
    Database db = await database;
    return await db.delete(
      'topic',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
