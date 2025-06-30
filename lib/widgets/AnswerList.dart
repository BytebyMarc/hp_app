import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs/false_question_bloc.dart';
import '../bloc/states/false_question_state.dart';
import 'AnswerOption.dart';

class AnswerList extends StatelessWidget {
  const AnswerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hier einfach den kompletten State ziehen
    final state = context.watch<FalseQuestionBloc>().state;

    if (state is! FalseQuestionSelected) return const SizedBox.shrink();

    return Column(
      children: List.generate(
        state.question.answers.length,
            (i) => AnswerOption(i),
      ),
    );
  }
}

