import 'package:flutter/material.dart';

/// Widget für die Steuerung: Evaluieren oder Nächste Frage.
class ControlButton extends StatelessWidget {
  /// Ob bereits ausgewertet wurde.
  final bool isEvaluated;
  /// Ob die Gesamtauswahl korrekt war.
  final bool isCorrect;
  /// Callback zum Auslösen der Bewertung.
  final VoidCallback onEvaluate;
  /// Callback zum Laden der nächsten Frage.
  final VoidCallback onNext;

  const ControlButton({
    super.key,
    required this.isEvaluated,
    required this.isCorrect,
    required this.onEvaluate,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isEvaluated) ...[
          ElevatedButton(
            onPressed: onEvaluate,
            child: const Text('Antwort überprüfen'),
          ),
        ] else ...[
          Text(
            isCorrect ? 'Richtig!' : 'Falsch!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: onNext,
            child: const Text('Nächste Frage'),
          ),
        ],
      ],
    );
  }
}