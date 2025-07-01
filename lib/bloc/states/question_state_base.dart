import 'package:hp_app/bloc/blocs/question_bloc_base.dart';



abstract class QuestionState {
  final String questionText;
  final List<String> answers;
  final List<int> selectedIndices;
  final bool isEvaluated;
  final bool isCorrect;

  /// Neu: die korrekten Antwort-Indizes
  final List<int> correctAnswerIndices;

  QuestionState({
    required this.questionText,
    required this.answers,
    required this.selectedIndices,
    required this.isEvaluated,
    required this.isCorrect,
    required this.correctAnswerIndices,  // hier aufnehmen
  });
}

/// Lädt noch
class QuestionLoading extends QuestionState {
  QuestionLoading()
      : super(
    questionText: '',
    answers: const [],
    selectedIndices: const [],
    isEvaluated: false,
    isCorrect: false,
    correctAnswerIndices: []
  );
}

/// Fehlerzustand
class QuestionError extends QuestionState {
  final String message;

  QuestionError(this.message)
      : super(
    questionText: '',
    answers: const [],
    selectedIndices: const [],
    isEvaluated: false,
    isCorrect: false,
    correctAnswerIndices: []
  );
}

/// Zustand, wenn eine Frage angezeigt oder beantwortet wurde
class QuestionSelected extends QuestionState {
  QuestionSelected({
    required String questionText,
    required List<String> answers,
    List<int>? selectedIndices,
    required bool isEvaluated,
    required bool isCorrect,
    required List<int> correctAnswerIndices,  // hier aufnehmen
  }) : super(
    questionText: questionText,
    answers: answers,
    selectedIndices: selectedIndices ?? const [],
    isEvaluated: isEvaluated,
    isCorrect: isCorrect,
    correctAnswerIndices: correctAnswerIndices,
  );

  QuestionSelected copyWith({
    String? questionText,
    List<String>? answers,
    List<int>? selectedIndices,
    bool? isEvaluated,
    bool? isCorrect,
    List<int>? correctAnswerIndices,  // hier aufnehmen
  }) {
    return QuestionSelected(
      questionText: questionText ?? this.questionText,
      answers: answers ?? this.answers,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      isEvaluated: isEvaluated ?? this.isEvaluated,
      isCorrect: isCorrect ?? this.isCorrect,
      correctAnswerIndices: correctAnswerIndices ?? this.correctAnswerIndices,
    );
  }
}
