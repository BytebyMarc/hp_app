import 'package:flutter/material.dart';

/// Widget zur Anzeige einer Liste von Antworten mit Multi-Select-Unterstützung
/// und Hervorhebung der richtigen und falschen Antworten nach Auswertung.
class AnswerList extends StatelessWidget {
  /// Liste der Antworttexte.
  final List<String> answers;

  /// Nullbasierte Indizes der aktuell ausgewählten Antworten.
  final List<int> selectedIndices;

  /// Nullbasierte Indizes der korrekten Antworten.
  final List<int> correctAnswerIndices;

  /// Ob bereits ausgewertet wurde.
  final bool isEvaluated;

  /// Callback beim Tippen auf eine Antwort: Übergibt den Index.
  final ValueChanged<int> onTap;

  const AnswerList({
    super.key,
    required this.answers,
    required this.selectedIndices,
    required this.correctAnswerIndices,
    required this.isEvaluated,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(answers.length, (index) {
        final answer = answers[index];
        final selected = selectedIndices.contains(index);

        Color? tileColor;
        Widget? trailing;

        if (isEvaluated) {
          if (correctAnswerIndices.contains(index)) {
            // Richtige Antworten: grün markieren und Häkchen
            tileColor = Colors.green.withValues(alpha: 0.2);
            trailing = const Icon(Icons.check_circle, color: Colors.green);
          } else if (selected && !correctAnswerIndices.contains(index)) {
            // Falsch ausgewählte: rot markieren und Kreuz
            tileColor = Colors.red.withValues(alpha: 0.2);
            trailing = const Icon(Icons.cancel, color: Colors.red);
          }
        }

        return Card(
          color: tileColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            onTap: () {
              if (!isEvaluated) onTap(index);
            },
            leading: Checkbox(
              value: selected,
              onChanged: isEvaluated ? null : (_) => onTap(index),
            ),
            title: Text(answer),
            trailing: trailing,
          ),
        );
      }),
    );
  }
}
