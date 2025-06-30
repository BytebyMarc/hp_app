import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs/false_question_bloc.dart';
import '../bloc/events/false_question_event.dart';
import '../bloc/states/false_question_state.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FalseQuestionBloc>().state;
    if (state is! FalseQuestionSelected) return const SizedBox.shrink();

    return ElevatedButton(
      onPressed: () {
        final bloc = context.read<FalseQuestionBloc>();
        bloc.add(
          state.isEvaluated ? NextQuestion() : EvaluateAnswers(),
        );
      },
      child: Text(
        state.isEvaluated
            ? (state.isCorrect ? 'Richtig! Nächste Frage' : 'Falsch – nächste Frage')
            : 'Antwort prüfen',
      ),
    );
  }
}
