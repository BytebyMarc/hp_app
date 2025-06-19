import 'package:equatable/equatable.dart';
import 'package:hp_app/models/categoryModel.dart';


abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoriesLoading extends CategoryState {}
class CategoriesLoaded extends CategoryState {
  final List<Category> categories;
  const CategoriesLoaded(this.categories);
  @override
  List<Object> get props => [categories];
}
class CategorySelected extends CategoryState {
  final int selectedId;
  const CategorySelected(this.selectedId);
  @override
  List<Object> get props => [selectedId];
}
class CategoriesError extends CategoryState {
  final String message;
  const CategoriesError(this.message);
  @override
  List<Object> get props => [message];
}
