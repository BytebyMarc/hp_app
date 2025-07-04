import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/get_question_sort_category.dart';
import '../bloc/blocs/category_question_page_bloc.dart';
import '../repository/get_question.dart';
import '../widgets/views/question_view.dart';

class CategoryQuestionPage extends StatelessWidget {
  final int catID;

  const CategoryQuestionPage({super.key,  required this.catID });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryQuestionPageBloc>(
      create: (_) => CategoryQuestionPageBloc(
        categoryListRepo: GetQuestionSortCategory(),
        questionRepo: GetQuestionRepository(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kategorien'),
        ),
        body: const QuestionView<CategoryQuestionPageBloc>(),
      ),
    );
  }
}
