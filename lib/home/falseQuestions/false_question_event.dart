abstract class FalseQuestionEvent {}

class SelectFalseQuestion extends FalseQuestionEvent {
  SelectFalseQuestion();
}

class ToggleAnswer extends FalseQuestionEvent {
  final int index;
  ToggleAnswer(this.index);
}

class EvaluateAnswers extends FalseQuestionEvent {}

class NextQuestion extends FalseQuestionEvent {}