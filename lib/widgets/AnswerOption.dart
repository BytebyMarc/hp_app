import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/falseQuestions/false_question_bloc.dart';
import '../home/falseQuestions/false_question_event.dart';
import '../home/falseQuestions/false_question_state.dart';



class AnswerOption extends StatelessWidget {
  final int index;
  const AnswerOption(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FalseQuestionBloc>().state;
    if (state is! FalseQuestionSelected) return const SizedBox.shrink();

    final answers = state.question.answers;
    final sel = state.selectedAnswerIndices;
    final isSelected = sel.contains(index);

    Color bg = Colors.white;
    if (state.isEvaluated) {
      if (state.rightSequence.contains(index)) {
        bg = Colors.green.shade100;
      } else if (isSelected) {
        bg = Colors.red.shade100;
      }
    } else if (isSelected) {
      bg = Colors.grey.shade200;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: state.isEvaluated
            ? null
            : () => context.read<FalseQuestionBloc>().add(ToggleAnswer(index)),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            answers[index],
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
