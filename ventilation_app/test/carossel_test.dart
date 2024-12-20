import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ventilation_app/elements/carossel.dart';

void main() {
// testWidgets('CarouselImageSlider displays images and texts', (WidgetTester tester) async {
//   // Test data
//   final imagePaths = [
//     'assets/typology/horizontal_vertical.jpg',
//     'assets/typology/slide.jpg',
//   ];
//   final imageTexts = [
//     'Horizontal and Vertical',
//     'Slide',
//   ];

//   // Build the widget
//   await tester.pumpWidget(
//     MaterialApp(
//       home: Scaffold(
//         body: CarouselImageSlider(
//           imageAssetPaths: imagePaths,
//           imageTexts: imageTexts,
//           height: 200.0,
//           borderRadius: 10.0,
//         ),
//       ),
//     ),
//   );

//   // Allow widgets to settle
//   await tester.pumpAndSettle();

//   // Verify each image and its corresponding text
//   for (var i = 0; i < imagePaths.length; i++) {
//     // Check if the image matches
//     expect(find.byWidgetPredicate(
//       (widget) => widget is Image && widget.image == AssetImage(imagePaths[i]),
//     ), findsOneWidget);

//     // Check if the text matches
//     expect(find.text(imageTexts[i]), findsOneWidget);
//   }

//   // Simulate a page change to the second image
//   final carouselFinder = find.byType(CarouselSlider);
//   final carousel = tester.widget<CarouselSlider>(carouselFinder);

//   // Trigger the callback for the second image
//   carousel.options.onPageChanged!(1, CarouselPageChangedReason.manual);

//   // Allow the carousel to settle
//   await tester.pumpAndSettle(); // Ensure widgets settle after page change

//   // Verify the second image and text are displayed
//   expect(find.text(imageTexts[1]), findsOneWidget);
// });


  testWidgets('CarouselImageSlider handles image loading errors', (WidgetTester tester) async {
    // Test data
    final imagePaths = ['assets/non_existent_image.png'];
    final imageTexts = ['Error Text'];

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CarouselImageSlider(
            imageAssetPaths: imagePaths,
            imageTexts: imageTexts,
          ),
        ),
      ),
    );

    // Simulate image load error
    await tester.pump(); // Ensure widgets are built
    final circularProgressFinder = find.byType(CircularProgressIndicator);
    expect(circularProgressFinder, findsOneWidget); // Error handler displays CircularProgressIndicator
  });
}
