abstract class FalseQuestionEvent {}

class SelectFalseQuestion extends FalseQuestionEvent {
  final int numberQuestion;
  SelectFalseQuestion({required this.numberQuestion});
}

class ToggleAnswer extends FalseQuestionEvent {
  final int index;
  ToggleAnswer(this.index);
}

class EvaluateAnswers extends FalseQuestionEvent {}

class NextQuestion extends FalseQuestionEvent {}