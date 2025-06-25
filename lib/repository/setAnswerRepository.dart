import 'package:hp_app/repository/dbConnection.dart';

class SetAnswerRepository {
  final int id;
  final bool answer;

  SetAnswerRepository({
    required this.id,
    required this.answer,
  });


  /// Speichert das aktuelle Objekt in der DB (insert oder update)
  Future<void> save() async {
    final db = await DbConnection.openDb();
     // Existierenden Datensatz (falls vorhanden) abfragen
    final existing = await db.query(
      'answer',
      columns: ['conditionAnswer'],
      where: 'Question_ID = ?',
      whereArgs: [id],
    );

    if (existing.isEmpty) {
      // Insert: wenn answer == false → zustand = 0, sonst = 1
      await db.insert(
        'answer',
        {
          'Question_ID': id,
          'conditionAnswer': answer ? 1 : 0,
        },
      );
    } else {
      // Update:
      if (!answer) {
        // Wenn answer false → stets zustand = 0
        await db.update(
          'answer',
          {'conditionAnswer': 0},
          where: 'Question_ID = ?',
          whereArgs: [id],
        );
      } else {
        // Wenn answer true → zustand um 1 erhöhen
        final currentZustand = existing.first['conditionAnswer'] as int;
        await db.update(
          'answer',
          {'conditionAnswer': currentZustand + 1},
          where: 'Question_ID = ?',
          whereArgs: [id],
        );
      }
    }
  }
}
