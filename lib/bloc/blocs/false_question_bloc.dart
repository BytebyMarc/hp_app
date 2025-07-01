import 'dart:math';
import 'package:hp_app/bloc/blocs/question_bloc_base.dart';
import 'package:hp_app/repository/get_false_questions_list.dart';
import '../../models/question_model.dart';
import '../states/question_state_base.dart';
import '../events/question_event_base.dart';
import 'dart:async';
import '../../../repository/get_question.dart';


class FalseQuestionBloc extends QuestionBlocBase {
  final GetFalseQuestionList _falseListRepo;
  final GetQuestionRepository _questionRepo;
  final Random _rnd = Random();

  /// Internal: alle geladenen Fragen als Modelle
  final List<QuestionModel> _questions = [];

  /// Zuletzt ausgelieferte Frage für checkAnswer()
  late QuestionModel _current;

  FalseQuestionBloc({
    required GetFalseQuestionList falseListRepo,
    required GetQuestionRepository questionRepo,
  })  : _falseListRepo = falseListRepo,
        _questionRepo = questionRepo,
        super() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Lade IDs der falschen Fragen
      final falseEntries = await _falseListRepo.fetchFalseAnswer();
      // Für jede ID die Frage laden
      for (var entry in falseEntries) {
        final model = await _questionRepo.fetchQuestion(idQuestion: entry.questionId);
        _questions.add(model);
      }
      // Erste Frage ausliefern
      add(NextQuestion());
    } catch (e, st) {
      addError(e, st);
    }
  }

  @override
  QuestionModel fetchNextQuestion() {
    if (_questions.isEmpty) {
      throw StateError('Keine Fragen geladen');
    }
    // Zufällige Frage auswählen
    _current = _questions[_rnd.nextInt(_questions.length)];
    return _current;
  }

  @override
  bool checkAnswer(QuestionSelected state) {
    // Vergleiche die Mengen der ausgewählten und korrekten Indizes
    final selectedSet = state.selectedIndices.toSet();
    final correctSet = _current.correctAnswerIndices.toSet();
    return selectedSet.length == correctSet.length &&
        selectedSet.difference(correctSet).isEmpty;
  }
}
