class FalseQuestionListModel {
  final int question_ID;
  final int conditionAnswer;

  FalseQuestionListModel({
    required this.question_ID,
    required this.conditionAnswer
  });

  factory FalseQuestionListModel.fromResult(map){

    return FalseQuestionListModel(
        question_ID: map['Question_ID'] as int,
        conditionAnswer: map['conditionAnswer'] as int,
    );
  }
  // debug funktion
  @override
  String toString() {
    return 'FalseQuestionListModel(question_ID: $question_ID, conditionAnswer: $conditionAnswer)';
  }
}