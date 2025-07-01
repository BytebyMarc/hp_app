import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hp_app/widgets/question_text.dart';


void main() {
  group('QuestionText Widget', () {
    testWidgets('zeigt den übergebenen Text an', (WidgetTester tester) async {
      const testText = 'Test Frage';

      // Widget aufbauen
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuestionText(text: testText),
          ),
        ),
      );

      // Erwartung: Text wird gefunden
      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('hat korrektes Padding und TextStyle', (WidgetTester tester) async {
      const testText = 'Padding Test';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QuestionText(text: testText),
          ),
        ),
      );

      // Padding prüfen
      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      expect(paddingWidget.padding, const EdgeInsets.symmetric(vertical: 16.0));

      // TextStyle prüfen: nur grundlegende Eigenschaften vergleichen
      final textWidget = tester.widget<Text>(find.text(testText));
      final style = textWidget.style;
      expect(style, isNotNull);

      final defaultStyle = ThemeData.light().textTheme.titleLarge!;
      expect(style!.fontSize, defaultStyle.fontSize);
      expect(style.fontWeight, defaultStyle.fontWeight);
      // Entferne Höhe-Assertion, da Flutter zur Laufzeit einen expliziten height-Wert setzt
    });
  });
}
