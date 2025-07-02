import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/get_false_questions_list.dart';
import 'package:hp_app/widgets/views/question_view.dart';
import 'package:hp_app/bloc/blocs/false_question_bloc.dart';
import '../repository/get_question.dart';

/// Seite für zufällige Mehrfachauswahl-Fragen
class FalseQuestionPage extends StatelessWidget {
  const FalseQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FalseQuestionBloc>(
      create: (_) => FalseQuestionBloc(
        falseListRepo: GetFalseQuestionList(),
        questionRepo: GetQuestionRepository(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Falsche Fragen (Mehrfachauswahl)'),
        ),
        body: const QuestionView<FalseQuestionBloc>(),
      ),
    );
  }
}