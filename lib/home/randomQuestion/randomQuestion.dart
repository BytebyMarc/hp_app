import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/repository/setAnswerRepository.dart';
import '../../repository/getQuestion.dart';
import 'random_question_bloc.dart';
import 'random_question_event.dart';
import 'random_question_state.dart';
import 'package:hp_app/repository/categoryRepository.dart';

class RandomQuestion extends StatelessWidget {
  const RandomQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = RandomQuestionBloc(
          questionRepository: GetQuestionRepository(),
        );
        bloc.add(SelectRandomQuestion());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Zufällige Fragen (Mehrfachauswahl)')),
        body: BlocBuilder<RandomQuestionBloc, RandomQuestionState>(
          builder: (context, state) {
            if (state is RandomQuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RandomQuestionSelected) {
              final sel = state.selectedAnswerIndices;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      state.question.question,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(state.question.answers.length, (i) {
                      final isSelected = sel.contains(i);
                      Color bg = Colors.white;
                      if (state.isEvaluated) {
                        if (state.rightSequence.contains(i)) {
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
                              : () => context.read<RandomQuestionBloc>().add(ToggleAnswer(i)),
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
                              state.question.answers[i],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                    // Button-Bereich
                    if (!state.isEvaluated) ...[
                      ElevatedButton(
                        onPressed: () => context.read<RandomQuestionBloc>().add(EvaluateAnswers()),
                        child: const Text('Antwort prüfen'),
                      ),
                    ] else ...[
                      ElevatedButton(
                        onPressed: () => context.read<RandomQuestionBloc>().add(NextQuestion()),
                        child: Text(
                          state.isCorrect
                              ? 'Richtig! Nächste Frage'
                              : 'Falsch – nächste Frage',
                        ),
                      ),
                    ],
                  ],
                ),
              );
            } else if (state is RandomQuestionError) {
              return Center(child: Text('Fehler: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
