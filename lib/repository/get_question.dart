import 'package:flutter/cupertino.dart';
import 'package:hp_app/models/question_model.dart';
import 'package:hp_app/repository/db_connection.dart';
import 'dart:math';

/// Repository for reading a prepopulated categories database (read-only).
class GetQuestionRepository {
  final random = Random();


  /// Liest alle Einträge aus der Tabelle 'categories'.
  Future<QuestionModel> fetchQuestion({int? idQuestion}) async {
    final int randomNumber = random.nextInt(1000)+1;
    final int setWhereArgs;
    if(idQuestion != null && idQuestion > 0){
      setWhereArgs = idQuestion;
      debugPrint('IdQuestion ist gesetzt');

    }else{
      setWhereArgs = randomNumber;
      debugPrint('random number');
    }

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
      whereArgs:   [setWhereArgs],
    );
    return QuestionModel.fromResult(result.first);
  }
}
