import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImageSlider extends StatefulWidget {
  final List<String> imageAssetPaths;
  final List<String> imageTexts; // Add a list for image text
  final double height;
  final double borderRadius; // Add a parameter for border radius

  const CarouselImageSlider({
    Key? key,
    required this.imageAssetPaths,
    required this.imageTexts, // Pass the text list
    this.height = 170.0,
    this.borderRadius = 15.0, // Set default border radius
  }) : super(key: key);

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  // ignore: unused_field
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imageAssetPaths.asMap().entries.map((entry) {
        int index = entry.key;
        String imagePath = entry.value;
        return Builder(
          builder: (BuildContext context) => ClipRRect(
            // Wrap with ClipRRect
            borderRadius:
                BorderRadius.circular(widget.borderRadius), // Set border radius
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: widget.height,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: CircularProgressIndicator()),
                ),
                Positioned(
                  bottom: 10.0, // Adjust padding (optional)
                  left: 10.0, // Adjust padding (optional)
                  child: Text(
                    widget.imageTexts[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      carouselController: CarouselController(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        height: widget.height,
        aspectRatio: 16 / 9, // Adjust aspect ratio as needed
        viewportFraction: 1, // Adjust visible portion of each image
        enableInfiniteScroll: widget.imageAssetPaths.length > 1,
        onPageChanged: (index, reason) =>
            setState(() => _currentImageIndex = index),
      ),
    );
  }
}
