import 'dart:math';
import 'package:hp_app/bloc/blocs/question_bloc_base.dart';
import 'package:hp_app/repository/get_false_questions_list.dart';
import '../../models/question_model.dart';
import '../events/question_event_base.dart';
import 'dart:async';
import '../../../repository/get_question.dart';

class FalseQuestionBloc extends QuestionBlocBase {
  final GetFalseQuestionList _falseListRepo;
  final GetQuestionRepository _questionRepo;
  final Random _rnd = Random();

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
      final falseEntries = await _falseListRepo.fetchFalseAnswer();
      for (var entry in falseEntries) {
        final model = await _questionRepo.fetchQuestion(idQuestion: entry.questionId);
        questions.add(model);
      }
      add(NextQuestion());
    } catch (e, st) {
      addError(e, st);
    }
  }

  @override
  QuestionModel fetchNextQuestion() {
    if (questions.isEmpty) {
      throw StateError('Keine Fragen geladen');
    }
    // Zufällige Frage auswählen
    current = questions[_rnd.nextInt(questions.length)];
    return current;
  }

}
