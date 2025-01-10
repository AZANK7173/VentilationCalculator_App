import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart'; // Update with actual import paths

void main() {
  group('Utility Functions', () {
    test('createUnitMap should create correct map', () {
      final result = createUnitMap('meters');
      expect(result, {'meters': true, 'inches': false});
    });

    test('isValidDouble should validate correctly', () {
      expect(isValidDouble('123.45', true), true);
      expect(isValidDouble('0', false), false);
      expect(isValidDouble('abc', true), false);
    });

    test('isValidInt should validate correctly', () {
      expect(isValidInt('123', true), true);
      expect(isValidInt('0', false), false);
      expect(isValidInt('abc', true), false);
    });
  });

  group('Widgets', () {
    testWidgets('TextEntry displays text with correct style', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextEntry(
              myColor: Colors.red,
              text: 'Hello',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      final text = find.text('Hello');
      expect(text, findsOneWidget);

      final textWidget = tester.widget<Text>(text);
      expect(textWidget.style?.color, Colors.red);
      expect(textWidget.style?.fontSize, 20);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('DividerWidget displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DividerWidget(300.0),
          ),
        ),
      );

      final divider = find.byType(Divider);
      expect(divider, findsOneWidget);

      final dividerWidget = tester.widget<Divider>(divider);
      expect(dividerWidget.color, const Color.fromARGB(255, 223, 241, 255));
      expect(dividerWidget.thickness, 1.0);
    });

    testWidgets('DimensionInputRow updates values correctly', (WidgetTester tester) async {
      String? numberValue;
      String? dropdownValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DimensionInputRow(
              labelText: 'Input',
              dropdownItems: ['m', 'cm'],
              onChanged: (num, unit) {
                numberValue = num;
                dropdownValue = unit;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), '42');
      await tester.pump();
      expect(numberValue, '42');

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('cm').last);
      await tester.pump();
      expect(dropdownValue, 'cm');
    });

    testWidgets('NextButton displays message on press', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextButton(
              text: 'Next',
              displayMessage: 'Button pressed!',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Next'));
      await tester.pump();

      expect(pressed, true);
      expect(find.text('Button pressed!'), findsOneWidget);
    });

    testWidgets('DisplayVentilationImprovement displays the correct label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DisplayVentilationInprovement(labelText: '50 l/s'),
          ),
        ),
      );

      expect(find.text('50 l/s'), findsOneWidget);
    });

    testWidgets('OpeningImage displays with correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OpeningImage(
              screenWidth: 400.0,
              filepath: 'assets/entry.jpg',
            ),
          ),
        ),
      );

      final image = find.byType(Image);
      expect(image, findsOneWidget);
    });

    testWidgets('CustomInputWidget initializes and updates correctly', (WidgetTester tester) async {
      String? inputValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomInputWidget(
              inputText: 'Enter Value:',
              initialValue: '42',
              onTextChanged: (value) {
                inputValue = value;
              },
            ),
          ),
        ),
      );

      expect(find.text('42'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '50');
      expect(inputValue, '50');
    });

    testWidgets('MultiplyByInput calculates result correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiplyByInput(multiplier: 2, ventilation: 5.0),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), '10');
      await tester.pump();

      expect(find.text('15 l/s'), findsOneWidget);
    });
  });
  group('Settings Functions', () {
    // Tests for createVentRateUnitMap
    test('createVentRateUnitMap should create correct map', () {
      final result = createVentRateUnitMap('m³/h');
      expect(result, {
        'l/s': false,
        'm³/s': false,
        'm³/h': true,
        'ACH': false,
        'CFM': false,
      });
    });

    // Tests for createWindSpeedUnitMap
    test('createWindSpeedUnitMap should create correct map', () {
      final result = createWindSpeedUnitMap('km/h');
      expect(result, {
        'km/h': true,
        'm/s': false
      });
    });

    // Tests for createTempUnitMap
    test('createTempUnitMap should create correct map', () {
      final result = createTempUnitMap('°F');
      expect(result, {
        '°C': false,
        '°F': true
      });
    });

    // Tests for getSelectedSetting
    test('getSelectedSetting should return correct key for a given value', () {
      final setting = {
        'l/s': false,
        'm³/h': true,
        'ACH': false,
      };

      final result = getSelectedSetting(setting);
      expect(result, 'm³/h');
    });

    test('getSelectedSetting should return null when no value is true', () {
      final setting = {
        'l/s': false,
        'm³/h': false,
        'ACH': false,
      };

      final result = getSelectedSetting(setting);
      expect(result, 'No setting selected');
    });
  });
}
