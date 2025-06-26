import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/getFalseQuestionsList.dart';
import 'package:hp_app/repository/getQuestion.dart';
import 'package:hp_app/repository/setAnswerRepository.dart';
import 'package:hp_app/home/falseQuestions/false_question_event.dart';
import 'package:hp_app/home/falseQuestions/false_question_state.dart';

class FalseQuestionBloc extends Bloc<FalseQuestionEvent, FalseQuestionState>  {
  final GetQuestionRepository questionRepository;
  final GetFalseQuestionList getFalseQuestionList;
  int currentQuestionNumber = 1;

  FalseQuestionBloc({ required this.questionRepository, required this.getFalseQuestionList})
      : super(FalseQuestionLoading()) {
    on<SelectFalseQuestion>(_onSelect);
    on<ToggleAnswer>(_onToggle);
    on<EvaluateAnswers>(_onEvaluate);
    on<NextQuestion>(_onNext);
  }

  Future<void> _onSelect(SelectFalseQuestion evt, Emitter emit) async {
    emit(FalseQuestionLoading());
    try {
      final liste = await getFalseQuestionList.fetchFalseAnswer();
      //debugPrint(currentQuestionNumber as String?);
        final q = await questionRepository.fetchQuestion(
            idQuestion: liste[currentQuestionNumber].question_ID);
        emit(FalseQuestionSelected(
            question: q,
            rightSequence: q.rightSequence,
            liste: liste
        ));

    } catch (e) {
      emit(FalseQuestionError(e.toString()));
    }
  }

  void _onToggle(ToggleAnswer evt, Emitter emit) {
    final state0 = state;
    if (state0 is FalseQuestionSelected && !state0.isEvaluated) {
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
    if (state0 is FalseQuestionSelected && !state0.isEvaluated) {
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
    currentQuestionNumber = currentQuestionNumber +1 ;
        add(SelectFalseQuestion());
  }
}
