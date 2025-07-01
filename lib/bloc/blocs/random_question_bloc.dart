import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/getQuestion.dart';
import 'package:hp_app/repository/setAnswerRepository.dart';
import '../states/random_question_state.dart';
import '../events/random_question_event.dart';

class RandomQuestionBloc extends Bloc<RandomQuestionEvent, RandomQuestionState> {
  final GetQuestionRepository questionRepository;


  RandomQuestionBloc({ required this.questionRepository})
      : super(RandomQuestionLoading()) {
    on<SelectRandomQuestion>(_onSelect);
    on<ToggleAnswer>(_onToggle);
    on<EvaluateAnswers>(_onEvaluate);
    on<NextQuestion>(_onNext);
  }

  Future<void> _onSelect(SelectRandomQuestion evt, Emitter emit) async {
    emit(RandomQuestionLoading());
    try {
      final q = await questionRepository.fetchQuestion();
      emit(RandomQuestionSelected(
        question: q, rightSequence: [],
      ));
    } catch (e) {
      emit(RandomQuestionError(e.toString()));
    }
  }

  void _onToggle(ToggleAnswer evt, Emitter emit) {
    final state0 = state;
    if (state0 is RandomQuestionSelected && !state0.isEvaluated) {
      final sel = List<int>.from(state0.selectedAnswerIndices);
      if (sel.contains(evt.index)) {
        sel.remove(evt.index);
      } else {
        sel.add(evt.index);
      }
      emit(state0.copyWith(selectedAnswerIndices: sel));
    }
  }

  void _onEvaluate(EvaluateAnswers evt, Emitter emit) async{
    final state0 = state;
    if (state0 is RandomQuestionSelected && !state0.isEvaluated) {
      final id = state0.question.id;
      final userSeq = state0.selectedAnswerIndices.join(',');
      final rightSeq = state0.rightSequence.join(',');
      final correct = userSeq == rightSeq;
      if(correct){
        await SetAnswerRepository(id: id, answer: true ).save();
      }else{
        await SetAnswerRepository(id: id, answer: false).save();
      }
      emit(state0.copyWith(isEvaluated: true, isCorrect: correct));
    }
  }

  void _onNext(NextQuestion evt, Emitter emit) {
    add(SelectRandomQuestion());
  }
}
