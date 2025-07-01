import 'package:hp_app/models/category_model.dart';
import 'package:hp_app/repository/db_connection.dart';

/// Repository for reading a prepopulated categories database (read-only).
class CategoryRepository {
  /// Liest alle Einträge aus der Tabelle 'categories'.
  Future<List<Category>> fetchCategories() async {
    final db = await DbConnection.openDb();
    final maps = await db.query(
      'categories',
      columns: [
        'IDCat AS id',
        'categorie AS name',
        'subtextCategorie AS subtitle',
      ],
    );
    return maps.map((m) => Category.fromMap(m)).toList();
  }
}
