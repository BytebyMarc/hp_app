abstract class QuestionEvent {}

class SelectAnswer extends QuestionEvent {
  final int index;
  SelectAnswer(this.index);
}

class EvaluateAnswers extends QuestionEvent {}

class NextQuestion extends QuestionEvent {}