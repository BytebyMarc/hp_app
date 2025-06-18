import 'package:equatable/equatable.dart';
import 'package:hp_app/models/categoryModel.dart';

abstract class CategoryPageState extends Equatable {
  const CategoryPageState();
  @override List<Object> get props => [];
}

class CategoriesLoading extends CategoryPageState {}

class CategoriesLoaded extends CategoryPageState {
  final List<Category> categories;
  const CategoriesLoaded(this.categories);
  @override List<Object> get props => [categories];
}

class CategorySelectionState extends CategoryPageState {
  final int selectedId;
  const CategorySelectionState(this.selectedId);
  @override List<Object> get props => [selectedId];
}

class CategoriesError extends CategoryPageState {
  final String message;
  const CategoriesError(this.message);
  @override List<Object> get props => [message];
}
