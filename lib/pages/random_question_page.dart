import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/get_question.dart';
import '../bloc/blocs/random_question_bloc.dart';
import '../widgets/views/question_view.dart';

class RandomQuestion extends StatelessWidget {
  const RandomQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomQuestionBloc>(
      create: (_) => RandomQuestionBloc(
        questionRepo: GetQuestionRepository(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Zufällige Fragen (Mehrfachauswahl)'),
        ),
        body: const QuestionView<RandomQuestionBloc>(),
      ),
    );
  }
}
