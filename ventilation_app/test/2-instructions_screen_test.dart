import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/screens/2-instructions.dart';
import 'package:ventilation_app/elements/bottom_who_message.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';

void main() {
  group('Instructions Screen Tests', () {
    testWidgets('renders all widgets correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const Instructions());

      // Check for main title
      expect(find.text('This tool estimates:'), findsOneWidget);

      // Check for list items
      expect(find.text('1. The ventilation rate of your space.'), findsOneWidget);
      
      // Check for RichText widgets
      expect(
        find.byWidgetPredicate((widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('2. The maximum occupancy')),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('3. The potential ventilation gap,')),
        findsOneWidget,
      );

      // Check for the "Got it!" button
      expect(find.text('Got it!'), findsOneWidget);
      expect(find.byType(NextButton), findsOneWidget);

      // Check for the bottom message
      expect(find.byType(BottomWhoMessage), findsOneWidget);
    });

    testWidgets('button navigates to /input_1 screen', (WidgetTester tester) async {
      // Mock a navigation observer
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const Instructions(),
          navigatorObservers: [mockObserver],
          routes: {
            '/input_1': (context) => const Scaffold(
                  body: Text('Input Screen'),
                ),
          },
        ),
      );

      // Tap the "Got it!" button
      await tester.tap(find.text('Got it!'));
      await tester.pumpAndSettle();

      // Verify navigation to '/input_1'
      expect(find.text('Input Screen'), findsOneWidget);
    });

    testWidgets('rich text renders with correct styles', (WidgetTester tester) async {
      await tester.pumpWidget(const Instructions());

      // Verify first RichText content and styles
      final firstRichText = tester.widget<RichText>(
        find.byWidgetPredicate((widget) => widget is RichText && widget.text.toPlainText().contains('2. The maximum occupancy')),
      );
      final firstSpan = (firstRichText.text as TextSpan).children![0] as TextSpan;
      final secondSpan = (firstRichText.text as TextSpan).children![1] as TextSpan;

      expect(firstSpan.text, '2. The maximum occupancy ');
      expect(firstSpan.style?.fontWeight, FontWeight.bold);
      expect(firstSpan.style?.color, const Color.fromARGB(255, 242, 244, 247));

      expect(secondSpan.text, contains('based on WHO recommended requirements.'));
      expect(secondSpan.style?.color, const Color.fromARGB(255, 242, 244, 247));
    });

    testWidgets('NextButton has correct style and function', (WidgetTester tester) async {
      await tester.pumpWidget(const Instructions());

      // Check button style
      final button = tester.widget<NextButton>(find.byType(NextButton));
      expect(button.myColor, const Color.fromARGB(255, 255, 109, 29));

      // Ensure tapping triggers the provided callback
      expect(button.onPressed, isNotNull);
    });
  });
}

// Mock class for navigation
class MockNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }
}
