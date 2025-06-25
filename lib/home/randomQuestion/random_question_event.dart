abstract class RandomQuestionEvent {}

class SelectRandomQuestion extends RandomQuestionEvent {}

class ToggleAnswer extends RandomQuestionEvent {
  final int index;
  ToggleAnswer(this.index);
}

class EvaluateAnswers extends RandomQuestionEvent {}

class NextQuestion extends RandomQuestionEvent {}