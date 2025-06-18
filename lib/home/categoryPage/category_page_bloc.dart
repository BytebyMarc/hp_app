import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/categoryRepository.dart';
import 'category_page_event.dart';
import 'category_page_state.dart';

class CategoryPageBloc extends Bloc<CategoryPageEvent, CategoryPageState> {
  final CategoryRepository repository;

  CategoryPageBloc({required this.repository}) : super(CategoriesLoading()) {
    on<LoadCategories>(_onLoad);
    on<SelectCategory>(_onSelect);
  }

  Future<void> _onLoad(LoadCategories event, Emitter<CategoryPageState> emit) async {
    try{
      final cats = await repository.fetchCategories();
      emit(CategoriesLoaded(cats));
    } catch (e){
      emit(CategoriesError(e.toString()));
    }
  }

  void _onSelect(SelectCategory event, Emitter<CategoryPageState> emit){
    emit(CategorySelectionState(event.categoryId));
      }
  }


