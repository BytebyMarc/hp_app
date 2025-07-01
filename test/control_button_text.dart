import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hp_app/widgets/control_button.dart';


void main() {
  group('ControlButton Widget Tests', () {
    testWidgets('displays evaluate button when not evaluated', (WidgetTester tester) async {
      var evaluateCalled = false;
      var nextCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ControlButton(
              isEvaluated: false,
              isCorrect: false,
              onEvaluate: () => evaluateCalled = true,
              onNext: () => nextCalled = true,
            ),
          ),
        ),
      );

      // Should find only the "Antwort überprüfen" button
      expect(find.text('Antwort überprüfen'), findsOneWidget);
      expect(find.text('Nächste Frage'), findsNothing);
      expect(find.text('Richtig!'), findsNothing);
      expect(find.text('Falsch!'), findsNothing);

      // Tap the evaluate button
      await tester.tap(find.text('Antwort überprüfen'));
      expect(evaluateCalled, isTrue);
      expect(nextCalled, isFalse);
    });

    testWidgets('displays correct feedback and next button when evaluated and correct', (WidgetTester tester) async {
      var evaluateCalled = false;
      var nextCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ControlButton(
              isEvaluated: true,
              isCorrect: true,
              onEvaluate: () => evaluateCalled = true,
              onNext: () => nextCalled = true,
            ),
          ),
        ),
      );

      // Should show "Richtig!" in green and next button
      final correctText = find.text('Richtig!');
      expect(correctText, findsOneWidget);
      expect(find.text('Nächste Frage'), findsOneWidget);
      expect(find.text('Antwort überprüfen'), findsNothing);

      final Text textWidget = tester.widget<Text>(correctText);
      expect(textWidget.style?.color, equals(Colors.green));
      expect(textWidget.style?.fontWeight, equals(FontWeight.bold));

      // Tap the next button
      await tester.tap(find.text('Nächste Frage'));
      expect(nextCalled, isTrue);
      expect(evaluateCalled, isFalse);
    });

    testWidgets('displays incorrect feedback and next button when evaluated and incorrect', (WidgetTester tester) async {
      var evaluateCalled = false;
      var nextCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ControlButton(
              isEvaluated: true,
              isCorrect: false,
              onEvaluate: () => evaluateCalled = true,
              onNext: () => nextCalled = true,
            ),
          ),
        ),
      );

      // Should show "Falsch!" in red and next button
      final wrongText = find.text('Falsch!');
      expect(wrongText, findsOneWidget);
      expect(find.text('Nächste Frage'), findsOneWidget);
      expect(find.text('Antwort überprüfen'), findsNothing);

      final Text textWidget = tester.widget<Text>(wrongText);
      expect(textWidget.style?.color, equals(Colors.red));
      expect(textWidget.style?.fontWeight, equals(FontWeight.bold));

      // Tap the next button
      await tester.tap(find.text('Nächste Frage'));
      expect(nextCalled, isTrue);
      expect(evaluateCalled, isFalse);
    });
  });
}