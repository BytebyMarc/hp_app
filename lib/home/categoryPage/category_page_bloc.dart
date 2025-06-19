import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';


class CategoryPageBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryPageBloc({required this.repository}) : super(CategoriesLoading()) {
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

  void _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) {
    emit(CategorySelected(event.categoryId));
  }
}