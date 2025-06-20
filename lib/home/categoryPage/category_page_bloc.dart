import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'package:hp_app/repository/getQuestion.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';


class CategoryPageBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  final GetQuestionRepository questionRepository;

  CategoryPageBloc({required this.repository, required this.questionRepository}) : super(CategoriesLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) async {
    emit(CategoriesLoading());
    try {
      final cats = await repository.fetchCategories();
      emit(CategoriesLoaded(cats));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) async {
    emit(CategoriesLoading());
    try {
      final question = await questionRepository.fetchQuestion();

      emit(CategorySelected(question));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }

   // emit(CategorySelected(event.categoryId));
  }
}