import 'package:equatable/equatable.dart';
import 'package:hp_app/models/categoryModel.dart';

import '../../models/questionModel.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategorySelected extends CategoryState {
  final QuestionModel question;
  final int? selectedAnswerIndex;
  final bool isAnswered;

  const CategorySelected({
    required this.question,
    this.selectedAnswerIndex,
    this.isAnswered = false,
  });

  @override
  List<Object?> get props => [
    question,
    selectedAnswerIndex,
    isAnswered,
  ];

  /// Ermöglicht das Aktualisieren einzelner Felder im State.
  CategorySelected copyWith({
    QuestionModel? question,
    int? selectedAnswerIndex,
    bool? isAnswered,
  }) {
    return CategorySelected(
      question: question ?? this.question,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }
}

class CategoriesError extends CategoryState {
  final String message;

  const CategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
