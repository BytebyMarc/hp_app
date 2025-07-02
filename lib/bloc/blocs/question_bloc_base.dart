import 'package:bloc/bloc.dart';
import 'package:hp_app/bloc/events/question_event_base.dart';
import 'package:hp_app/bloc/states/question_state_base.dart';
import '../../models/question_model.dart';

abstract class QuestionBlocBase extends Bloc<QuestionEvent, QuestionState> {
  late QuestionModel current;
  final List<QuestionModel> questions = [];
  QuestionBlocBase()
      : super(
    QuestionSelected(
      questionText: '',
      answers: const [],
      selectedIndices: const [],
      isEvaluated: false,
      isCorrect: false,
      correctAnswerIndices: [],
    ),
  ) {
    on<SelectAnswer>(_onSelectAnswer);
    on<EvaluateAnswers>(_onEvaluate);
    on<NextQuestion>(_onNext);
  }

  void _onSelectAnswer(SelectAnswer event, Emitter<QuestionState> emit) {
    final s = state as QuestionSelected;
    if (!s.isEvaluated) {
      final newSelection = List<int>.from(s.selectedIndices);
      if (newSelection.contains(event.index)) {
        newSelection.remove(event.index);
      } else {
        newSelection.add(event.index);
      }
      emit(s.copyWith(selectedIndices: newSelection));
    }
  }

  void _onEvaluate(EvaluateAnswers event, Emitter<QuestionState> emit) {
    final s = state as QuestionSelected;
    final result = checkAnswer(s);
    emit(s.copyWith(isEvaluated: true, isCorrect: result));
  }

  void _onNext(NextQuestion event, Emitter<QuestionState> emit) {
    final next = fetchNextQuestion();
    emit(QuestionSelected(
      questionText: next.question,
      answers: next.answers,
      selectedIndices: const [],
      isEvaluated: false,
      isCorrect: false,
      correctAnswerIndices: next.correctAnswerIndices,
    ));
  }
  /// Muss überschrieben werden: Prüft, ob die Auswahl korrekt ist
  bool checkAnswer(QuestionSelected state){
    final selectedSet = state.selectedIndices.toSet();
    final correctSet = current.correctAnswerIndices.toSet();
    return selectedSet.length == correctSet.length &&
        selectedSet.difference(correctSet).isEmpty;
  }

  /// Muss überschrieben werden: Nächste Frage laden
  QuestionModel fetchNextQuestion();
}

