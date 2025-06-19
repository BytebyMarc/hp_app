import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:hp_app/models/categoryModel.dart';

/// Repository for reading a prepopulated categories database (read-only).
class CategoryRepository {
  static Database? _db;

  /// Öffnet die Datenbank (einmalig), kopiert sie bei Bedarf aus den Assets.
  static Future<Database> _openDb() async {
    if (_db != null && _db!.isOpen) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'HpApp.db');
    final file = File(path);
    bool shouldCopy = false;

    if (!await file.exists()) {
      shouldCopy = true;
    } else {
      // Existierende DB prüfen: enthält sie die 'categories'-Tabelle?
      final tmpDb = await openDatabase(path, readOnly: true);
      final tables = await tmpDb.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='categories'"
      );
      await tmpDb.close();
      if (tables.isEmpty) {
        shouldCopy = true;
      }
    }

    if (shouldCopy) {
      // Verzeichnis anlegen und DB aus Assets kopieren
      await Directory(dirname(path)).create(recursive: true);
      final data = await rootBundle.load('lib/assets/db/HpApp.db');
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      print('DB aus Assets kopiert: $path');
    }

    // Öffne die vorhandene DB im Read-Only-Modus
    _db = await openDatabase(
      path,
      readOnly: true,
    );

    return _db!;
  }

  /// Liest alle Einträge aus der Tabelle 'categories'.
  Future<List<Category>> fetchCategories() async {
    final db = await _openDb();
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

  /// Schließt die Datenbankverbindung.
  Future<void> close() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      _db = null;
    }
  }
}
