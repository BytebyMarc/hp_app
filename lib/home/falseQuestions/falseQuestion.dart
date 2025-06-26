import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/getFalseQuestionsList.dart';
import '../../repository/getQuestion.dart';
import 'package:hp_app/home/falseQuestions/false_question_bloc.dart';
import 'package:hp_app/home/falseQuestions/false_question_state.dart';
import 'package:hp_app/home/falseQuestions/false_question_event.dart';

import '../../widgets/AnswerList.dart';
import '../../widgets/ControlButton.dart';
import '../../widgets/QuestionText.dart';

class FalseQuestion extends StatelessWidget {
  const FalseQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = FalseQuestionBloc(
          questionRepository: GetQuestionRepository(),
          getFalseQuestionList: GetFalseQuestionList(),
        );
        bloc.add(SelectFalseQuestion());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Zufällige Fragen (Mehrfachauswahl)')),
        body: BlocBuilder<FalseQuestionBloc, FalseQuestionState>(
          builder: (context, state) {
            if (state is FalseQuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FalseQuestionError) {
              return Center(child: Text('Fehler: ${state.message}'));
            }
            // Sobald wir im Selected-State sind, zeigen wir die Widgets
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  QuestionText(),
                  SizedBox(height: 16),
                  AnswerList(),
                  SizedBox(height: 24),
                  ControlButton(),
                  SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

