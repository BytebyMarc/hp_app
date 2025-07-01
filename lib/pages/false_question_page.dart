import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/get_false_questions_list.dart';
import '../bloc/events/question_event_base.dart';
import '../bloc/states/question_state_base.dart';
import 'package:hp_app/bloc/blocs/false_question_bloc.dart';
import '../repository/get_question.dart';
import '../widgets/answer_list.dart';
import '../widgets/control_button.dart';
import '../widgets/question_text.dart';

/// Seite für zufällige Mehrfachauswahl-Fragen
/// Seite für zufällige Mehrfachauswahl-Fragen
class FalseQuestionPage extends StatelessWidget {
  const FalseQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FalseQuestionBloc>(
      create: (_) => FalseQuestionBloc(
        falseListRepo: GetFalseQuestionList(),
        questionRepo:  GetQuestionRepository(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Zufällige Fragen (Mehrfachauswahl)'),
        ),
        body: BlocBuilder<FalseQuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionError) {
              return Center(child: Text('Fehler: \${state.message}'));
            } else if (state is QuestionSelected) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QuestionText(text: state.questionText),
                    const SizedBox(height: 16),

                    // Multi-Select: Liste der Antworten mit ausgewählten Indizes
                    AnswerList(
                      answers: state.answers,
                      selectedIndices: state.selectedIndices,
                      correctAnswerIndices: state.correctAnswerIndices,
                      isEvaluated: state.isEvaluated,
                      onTap: (index) {
                        if (!state.isEvaluated) {
                          context.read<FalseQuestionBloc>().add(SelectAnswer(index));
                        }
                      },
                    ),
                    const SizedBox(height: 24),

                    // Steuer-Buttons: Evaluieren oder Nächste Frage
                    ControlButton(
                      isEvaluated: state.isEvaluated,
                      isCorrect: state.isCorrect,
                      onEvaluate: () => context.read<FalseQuestionBloc>().add(EvaluateAnswers()),
                      onNext: () => context.read<FalseQuestionBloc>().add(NextQuestion()),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
