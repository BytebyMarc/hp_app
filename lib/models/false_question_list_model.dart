class FalseQuestionListModel {
  final int questionId;
  final int conditionAnswer;

  FalseQuestionListModel({
    required this.questionId,
    required this.conditionAnswer
  });

  factory FalseQuestionListModel.fromResult(map){

    return FalseQuestionListModel(
        questionId: map['Question_ID'] as int,
        conditionAnswer: map['conditionAnswer'] as int,
    );
  }
  // debug funktion
  @override
  String toString() {
    return 'FalseQuestionListModel(question_ID: $questionId, conditionAnswer: $conditionAnswer)';
  }
}