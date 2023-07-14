import 'package:flutter_task_project/app/models/search_history_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLLiteService {
  String searchHistoryTable = "search_history";
  Future<Database> openDataBase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, "searchDBBase.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $searchHistoryTable (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
          
        )
      ''');
        // "'CREATE TABLE $searchHistoryTable(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)'");
      },
    );
    return database;
  }

  Future<void> insertOperations(String searchText) async {
    Database database = await openDataBase();
    await database.insert(
      searchHistoryTable,
      {
        'name': searchText,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SearchHistoryModel>> getOperations() async {
    Database database = await openDataBase();
    List<Map<String, dynamic>> data = await database.query(searchHistoryTable);
    return List.generate(
        data.length, (index) => SearchHistoryModel.fromJson(data[index]));
  }

  Future<void> clearData({int? id}) async {
    Database database = await openDataBase();
    if (id != null) {
      await database.delete(searchHistoryTable, where: 'id=?', whereArgs: [id]);
    } else {
      await database.delete(searchHistoryTable);
    }
  }
}
