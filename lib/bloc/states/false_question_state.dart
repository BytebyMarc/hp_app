import '../../models/question_model.dart';


abstract class FalseQuestionState {}

class FalseQuestionLoading extends FalseQuestionState {}

class FalseQuestionSelected extends FalseQuestionState {
  final QuestionModel question;
  final List<int> selectedAnswerIndices;
  final bool isEvaluated;
  final bool isCorrect;
  final List<int> rightSequence;
  final List<dynamic> liste;
  int numberQuestion = 1 ;

  FalseQuestionSelected({
    required this.question,
    this.selectedAnswerIndices = const [],
    this.isEvaluated = false,
    this.isCorrect = false,
    required this.rightSequence,
    required this.liste,
  });

  FalseQuestionSelected copyWith({
    List<int>? selectedAnswerIndices,
    bool? isEvaluated,
    bool? isCorrect,
  }) {
    return FalseQuestionSelected(
      question: question,
      rightSequence: rightSequence,
      selectedAnswerIndices: selectedAnswerIndices ?? this.selectedAnswerIndices,
      isEvaluated: isEvaluated ?? this.isEvaluated,
      isCorrect: isCorrect ?? this.isCorrect,
      liste: liste,
    );
  }
}

class FalseQuestionError extends FalseQuestionState {
  final String message;
  FalseQuestionError(this.message);
}