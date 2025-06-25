import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'package:hp_app/repository/getQuestion.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';

class CategoryPageBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  final GetQuestionRepository questionRepository;

  CategoryPageBloc({
    required this.repository,
    required this.questionRepository,
  }) : super(CategoriesLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
    on<AnswerQuestion>(_onAnswerTap);
    on<NextQuestion>(_onNextQuestion);  // ← neuer Handler
  }

  Future<void> _onLoadCategories(
      LoadCategories event,
      Emitter<CategoryState> emit,
      ) async {
    emit(CategoriesLoading());
    try {
      final cats = await repository.fetchCategories();
      emit(CategoriesLoaded(cats));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> _onSelectCategory(
      SelectCategory event,
      Emitter<CategoryState> emit,
      ) async {
    emit(CategoriesLoading());
    try {
      final question = await questionRepository.fetchQuestion();
      emit(CategorySelected(question: question));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  // Wird ausgelöst, wenn der User eine Antwort antippt
  void _onAnswerTap(
      AnswerQuestion event,
      Emitter<CategoryState> emit,
      ) {
    if (state is CategorySelected) {
      final current = state as CategorySelected;
      emit(
        current.copyWith(
          selectedAnswerIndex: event.selectedIndex,
          isAnswered: true,
        ),
      );
    }
  }

  // Wird ausgelöst, wenn der User zur nächsten Frage wechselt
  Future<void> _onNextQuestion(
      NextQuestion event,
      Emitter<CategoryState> emit,
      ) async {
    emit(CategoriesLoading());
    try {
      final nextQuestion = await questionRepository.fetchQuestion();
      emit(CategorySelected(question: nextQuestion));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
