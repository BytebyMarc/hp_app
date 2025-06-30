import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs/false_question_bloc.dart';
import '../bloc/states/false_question_state.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bloc holen und direkt den String extrahieren
    final question = context
        .select<FalseQuestionBloc, String>(
          (bloc) => (bloc.state as FalseQuestionSelected).question.question,
    );

    return Text(
      question,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
