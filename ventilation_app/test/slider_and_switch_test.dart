import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart'; 

void main() {
  group('Slider0To100 Widget', () {
    testWidgets('should update value on slider drag', (WidgetTester tester) async {
      double sliderValue = 0.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Slider0To100(
              dragText: 'Drag me!',
              initialValue: 50,
              onValueChanged: (value) {
                sliderValue = value;
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(sliderValue, 0.0);

      // Simulate a slider drag
      await tester.drag(find.byType(Slider), const Offset(100, 0));
      await tester.pump();

      // Verify the updated slider value
      expect(sliderValue, greaterThan(50.0));
    });
  });

  group('Switcher Widget', () {
    testWidgets('should toggle switch state', (WidgetTester tester) async {
      bool switchState = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Switcher(
              switchText: 'Enable feature',
              initialValue: false,
              onToggle: (value) {
                switchState = value;
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(switchState, false);

      // Simulate switch toggle
      await tester.tap(find.byType(Switch));
      await tester.pump();

      // Verify the switch state has been updated
      expect(switchState, true);
    });
  });
}
