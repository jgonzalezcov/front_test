import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test/src/models/topic_model.dart';

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
      CREATE TABLE topic(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        topic TEXT,
        user_id INTEGER
      )
    ''');
  }

//inserta los temas de estudios
  Future<int> insertTopic(TopicModel topics) async {
    Database db = await database;
    return await db.insert('topic', topics.toMap());
  }

//lee los temas de estudios
  Future<List<TopicModel>> getTopics() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('topic');
    return List.generate(maps.length, (index) {
      return TopicModel(
        id: maps[index]['id'],
        topic: maps[index]['topic'],
        userId: maps[index]['user_id'], // Corregir el nombre de la columna
      );
    });
  }

//actualiza los temas de estudios por id
  Future<int> updateTopic(TopicModel topic) async {
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
