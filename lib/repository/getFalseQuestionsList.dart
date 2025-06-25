import 'package:flutter/cupertino.dart';
import 'package:hp_app/models/falseQuestionListModel.dart';
import 'package:hp_app/repository/dbConnection.dart';

class GetFalseQuestionList{

  Future <List<FalseQuestionListModel>> fetchFalseAnswer() async {
    debugPrint('liste wird gelesen');
    final db = await DbConnection.openDb();
    final result = await db.query('answer',
      columns: [
        'Question_ID AS Question_ID',
        'conditionAnswer AS conditionAnswer',
      ],
      where: 'conditionAnswer = ?',
      whereArgs: [0],
    );
    return result
        .map((row) => FalseQuestionListModel.fromResult(row))
        .toList();
  }

}