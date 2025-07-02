import 'package:hp_app/bloc/blocs/question_bloc_base.dart';
import '../../models/question_model.dart';
import '../events/question_event_base.dart';
import 'dart:async';
import '../../../repository/get_question.dart';

class RandomQuestionBloc extends QuestionBlocBase {
  final GetQuestionRepository _questionRepo;
  int _number = 0;

  RandomQuestionBloc({
    required GetQuestionRepository questionRepo,
  })  :
        _questionRepo = questionRepo,
        super() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
        final model = await _questionRepo.fetchQuestion();
        questions.add(model);
      add(NextQuestion());
    } catch (e, st) {
      addError(e, st);
    }
  }

  @override
  Future<QuestionModel> fetchNextQuestion() async {
    if (questions.isEmpty) {
      throw StateError('Keine Fragen geladen');
    }try {
      final model = await _questionRepo.fetchQuestion();
      questions.add(model);
    }catch(e, st){
      addError(e, st);
    }
    current = questions[_number++];
    return current;
  }
}
