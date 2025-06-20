import 'package:hp_app/models/questionModel.dart';
import 'package:hp_app/repository/dbConnection.dart';

/// Repository for reading a prepopulated categories database (read-only).
class GetQuestionRepository {
  /// Liest alle Einträge aus der Tabelle 'categories'.
  Future<QuestionModel> fetchQuestion({int? idQuestion}) async {
    final db = await DbConnection.openDb();
    final result = await db.query(
      'question',
      columns: [
        'ID_question AS id',
        'activ AS activ',
        'category AS category',
        'question AS question',
        'answer1 AS answer1',
        'answer2 AS answer2',
        'answer3 AS answer3',
        'answer4 AS answer4',
        'answer5 AS answer5',
        'correct AS right',
        'month AS month',
        'year AS year',
      ],
      where: 'ID_question = ?',
      whereArgs:   [5],
    );
    return QuestionModel.fromResult(result.first);
  }
}
