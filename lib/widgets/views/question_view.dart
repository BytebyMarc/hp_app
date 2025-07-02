import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/events/question_event_base.dart';
import '../../bloc/states/question_state_base.dart';
import '../answer_list.dart';
import '../control_button.dart';
import '../question_text.dart';

class QuestionView<B extends Bloc<QuestionEvent, QuestionState>> extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, QuestionState>(
      builder: (context, state) {
        if (state is QuestionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionError) {
          return Center(child: Text('Fehler: ${state.message}'));
        } else if (state is QuestionSelected) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QuestionText(text: state.questionText),
                const SizedBox(height: 16),
                AnswerList(
                  answers: state.answers,
                  selectedIndices: state.selectedIndices,
                  correctAnswerIndices: state.correctAnswerIndices,
                  isEvaluated: state.isEvaluated,
                  onTap: (index) {
                    if (!state.isEvaluated) {
                      context.read<B>().add(SelectAnswer(index));
                    }
                  },
                ),
                const SizedBox(height: 24),
                ControlButton(
                  isEvaluated: state.isEvaluated,
                  isCorrect: state.isCorrect,
                  onEvaluate: () => context.read<B>().add(EvaluateAnswers()),
                  onNext: () => context.read<B>().add(NextQuestion()),
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
