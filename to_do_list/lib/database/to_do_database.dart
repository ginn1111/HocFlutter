import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/database/to_do_table.dart';

class ToDoDatabase {
  static const String DATABASE_NAME = 'todo.db';
  static const int DATABASE_VERSION = 1;
  static Database _database;
  ToDoDatabase._internal();
  static ToDoDatabase instance = ToDoDatabase._internal();

  List<String> initScripts = [ToDoTable.CREATE_TABLE_QUERY];
  List<String> migrationScripts = [ToDoTable.DROP_TABLE_QUERY];

  Database get database => _database;

  init() async {
    print('init');
    _database = await openDatabase(
        join(await getDatabasesPath(), DATABASE_NAME), onCreate: (db, version) {
      initScripts.forEach((script) {
        db.execute(script);
      });
    }, onUpgrade: (db, oldVersion, newVersion) {
      migrationScripts.forEach((script) {
        db.execute(script);
      });
    }, version: DATABASE_VERSION);
  }
}
