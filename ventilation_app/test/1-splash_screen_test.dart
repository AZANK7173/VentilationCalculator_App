import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/bottom_who_message.dart';
import 'package:ventilation_app/screens/1-splash_screen.dart';

void main() {
  group('SplashScreen Tests', () {
    testWidgets('renders all widgets correctly', (WidgetTester tester) async {
      await tester.pumpWidget(SplashScreen());

      // Check for the app's title
      expect(find.text('Ventilation Calculator'), findsOneWidget);

      // Check for welcome text
      expect(find.text('Welcome to the'), findsOneWidget);

      // Check for description text
      expect(
        find.text(
            'This calculator helps you figure out how well your space is ventilated. Good ventilation is important to avoid diseases.'),
        findsOneWidget,
      );

      // Check for the image
      expect(find.byType(Image), findsOneWidget);

      // Check for the button
      expect(find.text("Let's get started"), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Check for the bottom navigation message
      expect(find.byType(BottomWhoMessage), findsOneWidget);
    });

    testWidgets('button navigates to /second screen', (WidgetTester tester) async {
      // Mock a navigation observer
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(),
          navigatorObservers: [mockObserver],
          routes: {
            '/second': (context) => const Scaffold(
                  body: Text('Second Screen'),
                ),
          },
        ),
      );

      // Tap the button
      await tester.tap(find.text("Let's get started"));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Second Screen'), findsOneWidget);
    });

    testWidgets('widgets are correctly styled', (WidgetTester tester) async {
      await tester.pumpWidget(SplashScreen());

      // Check welcome text style
      final welcomeText = tester.widget<Text>(find.text('Welcome to the'));
      expect(welcomeText.style?.color, equals(primaryColor));
      expect(welcomeText.style?.fontSize, equals(20.0));
      expect(welcomeText.style?.fontWeight, equals(FontWeight.bold));

      // Check app name text style
      final appNameText = tester.widget<Text>(find.text('Ventilation Calculator'));
      expect(appNameText.style?.color, equals(accentColor));
      expect(appNameText.style?.fontSize, equals(30.0));
      expect(appNameText.style?.fontWeight, equals(FontWeight.bold));

      // Check button style
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), equals(buttonColor));
      expect(button.style?.minimumSize?.resolve({}), equals(const Size(350, 55.0)));
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
