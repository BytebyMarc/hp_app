import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection {
  static Database? _db;

  /// Öffnet (einmalig) die vorbefüllte DB aus den Assets im Read-Only-Modus.
  static Future<Database> openDb() async {
    if (_db != null && _db!.isOpen) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'HpApp.db');
    final file = File(path);

    // 1) Nur kopieren, falls die Datei nicht existiert
    if (!await file.exists()) {
      // Verzeichnis anlegen
      await Directory(dirname(path)).create(recursive: true);

      // Asset laden (Pfad muss mit pubspec übereinstimmen)
      final data = await rootBundle.load('lib/assets/db/HpApp.db');
      final bytes = data.buffer.asUint8List();

      // In Geräte-Dateisystem schreiben
      await file.writeAsBytes(bytes, flush: true);
      print('📦 Datenbank kopiert nach $path');
    }

    // 2) DB öffnen (Read-Only, weil vorbefüllt)
    _db = await openDatabase(
      path,
      readOnly: true,
    );

    return _db!;
  }

  /// Schließt die DB (optional).
  static Future<void> closeDb() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      _db = null;
    }
  }
}
