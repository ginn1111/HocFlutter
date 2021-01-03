import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/database/to_do_database.dart';
import 'package:to_do_list/models/to_do.dart';

class ToDoTable {
  static const String TABLE_NAME = 'todo';
  static const String CREATE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      title TEXT,
      content TEXT
    )
   ''';

  static const String DROP_TABLE_QUERY = ''' 
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<void> insertToDo(ToDo toDo) async {
    final Database db = ToDoDatabase.instance.database;
    await db.insert(TABLE_NAME, toDo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteToDo(ToDo toDo) async {
    final Database db = ToDoDatabase.instance.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [toDo.id]);
  }

  Future<List<ToDo>> selectAllToDo() async {
    final Database db = ToDoDatabase.instance.database;
    List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
    return List.generate(maps.length, (index) {
      return ToDo(
          id: maps[index]['id'],
          title: maps[index]['title'],
          content: maps[index]['content']);
    });
  }
}
