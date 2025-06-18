import 'package:equatable/equatable.dart';

abstract class CategoryPageEvent extends Equatable {
  const CategoryPageEvent();
  @override List<Object> get props => [];
}

class LoadCategories extends CategoryPageEvent {}

class SelectCategory extends CategoryPageEvent {
  final int categoryId;
  const SelectCategory(this.categoryId);
  @override List<Object> get props => [categoryId];
}
