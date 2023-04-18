import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:outflow/modal/category_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  // private constructor
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('outflow.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tableCategories(
        "${CategoryFields.id}" INTEGER PRIMARY KEY AUTOINCREMENT,
        "${CategoryFields.categoryName}" TEXT NOT NULL,
        "${CategoryFields.CategoryColor}" TEXT NOT NULL,
        "${CategoryFields.expenseAmount}" DECIMAL NOT NULL,
        "${CategoryFields.date}" TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertCategory(CategoryModel category) async {
    final db = await instance.database;
    final categoryMap = category.toJson();
    final id = await db.insert('tableCategories', categoryMap);
    return id;
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await instance.database;
    final results = await db.query(tableCategories);
    return results.map((map) => CategoryModel.fromJson(map)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
