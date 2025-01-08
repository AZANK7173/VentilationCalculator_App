import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart'; // Update path as needed

void main() {
  group('OpeningImage Widget', () {
    testWidgets(
        'should display image with correct dimensions and border radius',
        (WidgetTester tester) async {
      const String testFilePath = 'assets/test_image.png';
      const double testScreenWidth = 400.0;
      const double testBorderRadius = 20.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OpeningImage(
              screenWidth: testScreenWidth,
              filepath: testFilePath,
              borderRadius: testBorderRadius,
            ),
          ),
        ),
      );

      // Find the ClipRRect widget
      final clipRRectFinder = find.byType(ClipRRect);

      // Verify the ClipRRect widget has the correct border radius
      final clipRRectWidget = tester.widget<ClipRRect>(clipRRectFinder);
      expect(clipRRectWidget.borderRadius,
          BorderRadius.circular(testBorderRadius));

      // Find the Image widget
      final imageFinder = find.byType(Image);

      // Verify the Image widget is using the correct file path
      final imageWidget = tester.widget<Image>(imageFinder);
      expect((imageWidget.image as AssetImage).assetName, testFilePath);

      // Verify the Image widget has the correct width
      expect(imageWidget.width, testScreenWidth * 0.90);

      // Verify the Image widget fit property
      expect(imageWidget.fit, BoxFit.cover);
    });
  });
}
