import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart'; // Update the import path

/*
Widget test that verifies the following aspects:

Title is displayed correctly.
Back button triggers onPressed1.
Home button triggers onPressed2.
*/

void main() {
  testWidgets('MyAppBar displays title and responds to button actions', (WidgetTester tester) async {
    // Track button press events
    bool onPressed1Called = false;
    bool onPressed2Called = false;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: MyAppBar(
            onPressed1: () => onPressed1Called = true,
            onPressed2: () => onPressed2Called = true,
          ),
        ),
      ),
    );

    // Verify the title is displayed
    expect(find.text('Ventilation Calculator'), findsOneWidget);

    // Tap the back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump(); // Rebuild the widget after interaction
    expect(onPressed1Called, isTrue);

    // Tap the home button
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump(); // Rebuild the widget after interaction
    expect(onPressed2Called, isTrue);
  });
}
