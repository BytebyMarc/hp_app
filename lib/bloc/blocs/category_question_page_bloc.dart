import 'package:hp_app/bloc/blocs/question_bloc_base.dart';
import 'package:hp_app/models/question_model.dart';
import 'dart:math';
import 'package:hp_app/bloc/blocs/question_bloc_base.dart';
import 'package:hp_app/repository/get_false_questions_list.dart';
import '../../models/question_model.dart';
import '../../repository/get_question_sort_category.dart';
import '../events/question_event_base.dart';
import 'dart:async';
import '../../../repository/get_question.dart';



class CategoryQuestionPageBloc extends QuestionBlocBase {

  final GetQuestionSortCategory _categoryListRepo;
  final GetQuestionRepository _questionRepo;
  final Random _rnd = Random();

  CategoryQuestionPageBloc({
  required GetQuestionSortCategory categoryListRepo,
  required GetQuestionRepository questionRepo,
  })  : _categoryListRepo = categoryListRepo,
  _questionRepo = questionRepo,
  super() {
  _initialize();
  }

  Future<void> _initialize() async {
  try {
  final falseEntries = await _categoryListRepo.fetchFalseAnswer();
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
  Future<QuestionModel> fetchNextQuestion() async {
  if (questions.isEmpty) {
  throw StateError('Keine Fragen geladen');
  }
  // Zufällige Frage auswählen
  current = questions[_rnd.nextInt(questions.length)];
  return current;
  }

  }
