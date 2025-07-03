import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/models/question_model.dart';
import '../bloc/blocs/category_question_page_bloc.dart';
import '../bloc/blocs/false_question_bloc.dart';
import '../repository/get_question.dart';
import '../widgets/views/question_view.dart';

class CategoryQuestionPage extends StatelessWidget {
  final int catID;

  const CategoryQuestionPage({super.key,  required this.catID });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryQuestionPageBloc>(
      create: (_) => CategoryQuestionPageBloc(
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
