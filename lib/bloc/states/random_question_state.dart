import '../../models/question_model.dart';

abstract class RandomQuestionState {}

class RandomQuestionLoading extends RandomQuestionState {}

class RandomQuestionSelected extends RandomQuestionState {
  final QuestionModel question;
  final List<int> selectedAnswerIndices;
  final bool isEvaluated;
  final bool isCorrect;
  final List<int> rightSequence;

  RandomQuestionSelected({
    required this.question,
    this.selectedAnswerIndices = const [],
    this.isEvaluated = false,
    this.isCorrect = false,
    required this.rightSequence,
  });

  RandomQuestionSelected copyWith({
    List<int>? selectedAnswerIndices,
    bool? isEvaluated,
    bool? isCorrect,
  }) {
    return RandomQuestionSelected(
      question: question,
      rightSequence: rightSequence,
      selectedAnswerIndices: selectedAnswerIndices ?? this.selectedAnswerIndices,
      isEvaluated: isEvaluated ?? this.isEvaluated,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

class RandomQuestionError extends RandomQuestionState {
  final String message;
  RandomQuestionError(this.message);
}