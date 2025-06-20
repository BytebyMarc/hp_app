import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}


class SelectCategory extends CategoryEvent {
  final int categoryId;
  const SelectCategory(this.categoryId);
  @override
  List<Object> get props => [categoryId];
}


class Answer extends CategoryEvent{


}