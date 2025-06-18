import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:hp_app/models/categoryModel.dart';

class CategoryRepository {
  static Future<Database> _openDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'HpApp.db');
    return openDatabase(path);
  }

  Future<List<Category>> fetchCategories() async {
    final db = await _openDb();
    final maps = await db.query('categories');
    return maps.map((m) => Category.fromMap(m)).toList();
  }
}
