import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/bottom_who_message.dart'; 

void main() {
  testWidgets('BottomWhoMessage displays styled text and respects layout', (WidgetTester tester) async {
    // Define a color to test
    const testColor = Colors.blue;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottomWhoMessage(myColor: testColor),
        ),
      ),
    );

    // Find the RichText widget
    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);

    // Inspect the RichText content
    final richTextWidget = tester.widget<RichText>(richTextFinder);
    final textSpans = richTextWidget.text as TextSpan;

    // Extract and verify TextSpan children
    final children = textSpans.children!;
    expect(children[0], isA<TextSpan>());
    expect((children[0] as TextSpan).text, 'ⓘ We use formulas by the ');
    expect((children[0] as TextSpan).style!.color, testColor);
    expect((children[0] as TextSpan).style!.fontWeight, isNull); // Not bold

    expect(children[1], isA<TextSpan>());
    expect((children[1] as TextSpan).text, 'World Health Organization (WHO)');
    expect((children[1] as TextSpan).style!.color, testColor);
    expect((children[1] as TextSpan).style!.fontWeight, FontWeight.bold); // Bold

    expect(children[2], isA<TextSpan>());
    expect((children[2] as TextSpan).text, ' to calculate ventilation rates.');
    expect((children[2] as TextSpan).style!.color, testColor);
    expect((children[2] as TextSpan).style!.fontWeight, isNull); // Not bold
  });
}
