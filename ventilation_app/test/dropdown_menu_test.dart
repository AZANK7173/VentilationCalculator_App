import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart'; 

void main() {
  group('DropdownButtonExample Widget Tests', () {
    testWidgets('should display initial value if provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownButtonExample(
              items: ['Item 1', 'Item 2', 'Item 3'],
              initialValue: 'Item 2',
            ),
          ),
        ),
      );

      // Find the DropdownButton
      final dropdownFinder = find.byType(DropdownButton<String>);
      expect(dropdownFinder, findsOneWidget);

      // Verify the selected value is 'Item 2'
      final dropdownButton = tester.widget<DropdownButton<String>>(dropdownFinder);
      expect(dropdownButton.value, equals('Item 2'));
    });

    testWidgets('should allow changing dropdown value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownButtonExample(
              items: ['Item 1', 'Item 2', 'Item 3'],
            ),
          ),
        ),
      );

      // Find the DropdownButton
      final dropdownFinder = find.byType(DropdownButton<String>);
      expect(dropdownFinder, findsOneWidget);

      // Tap the dropdown to open
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      // Select a new value
      final newValueFinder = find.text('Item 3');
      await tester.tap(newValueFinder);
      await tester.pumpAndSettle();

      // Verify the new selected value
      final dropdownButton = tester.widget<DropdownButton<String>>(dropdownFinder);
      expect(dropdownButton.value, equals('Item 3'));
    });

    testWidgets('should display default value if no initial value provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownButtonExample(
              items: ['Item 1', 'Item 2', 'Item 3'],
            ),
          ),
        ),
      );

      // Find the DropdownButton
      final dropdownFinder = find.byType(DropdownButton<String>);
      expect(dropdownFinder, findsOneWidget);

      // Verify the default selected value is the first item
      final dropdownButton = tester.widget<DropdownButton<String>>(dropdownFinder);
      expect(dropdownButton.value, equals('Item 1'));
    });

  });
}
