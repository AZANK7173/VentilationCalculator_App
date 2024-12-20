import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/mec_or_nat.dart'; 

void main() {
  group('MecOrNatToggleButtons Widget', () {
    testWidgets('should initialize with correct selection', (WidgetTester tester) async {
      bool? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MecOrNatToggleButtons(
              initialNat: true,
              onSelectionChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      // Verify initial state
      final ToggleButtons toggleButtons = tester.widget(find.byType(ToggleButtons));
      expect(toggleButtons.isSelected[0], true);
      expect(toggleButtons.isSelected[1], false);
    });

    testWidgets('should switch to "Mechanically" when tapped', (WidgetTester tester) async {
      bool? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MecOrNatToggleButtons(
              initialNat: true,
              onSelectionChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      // Tap the "Mechanically" button
      await tester.tap(find.text('Mechanically'));
      await tester.pump();

      // Verify the updated selection
      final ToggleButtons toggleButtons = tester.widget(find.byType(ToggleButtons));
      expect(toggleButtons.isSelected[0], false);
      expect(toggleButtons.isSelected[1], true);

      // Verify the callback value
      expect(selectedValue, false); // Mechanically corresponds to `false`
    });

    testWidgets('should switch to "Naturally" when tapped', (WidgetTester tester) async {
      bool? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MecOrNatToggleButtons(
              initialNat: false,
              onSelectionChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      // Tap the "Naturally" button
      await tester.tap(find.text('Naturally'));
      await tester.pump();

      // Verify the updated selection
      final ToggleButtons toggleButtons = tester.widget(find.byType(ToggleButtons));
      expect(toggleButtons.isSelected[0], true);
      expect(toggleButtons.isSelected[1], false);

      // Verify the callback value
      expect(selectedValue, true); // Naturally corresponds to `true`
    });
  });
}
