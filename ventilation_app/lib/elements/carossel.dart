import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImageSlider extends StatefulWidget {
  final List<String> imageAssetPaths;
  final double height;

  const CarouselImageSlider({
    Key? key,
    required this.imageAssetPaths,
    this.height = 200.0,
  }) : super(key: key);

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imageAssetPaths.map((imagePath) {
        return Builder(
          builder: (BuildContext context) => Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: widget.height,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      }).toList(),
      carouselController: CarouselController(),
      options: CarouselOptions(
        height: widget.height,
        aspectRatio: 16 / 9, // Adjust aspect ratio as needed
        viewportFraction: 0.8, // Adjust visible portion of each image
        enableInfiniteScroll: widget.imageAssetPaths.length >
            1, // Enable looping for multiple images
        onPageChanged: (index, reason) =>
            setState(() => _currentImageIndex = index),
      ),
    );
  }
}
