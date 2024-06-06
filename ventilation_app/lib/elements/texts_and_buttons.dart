import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';

class TextEntry extends StatelessWidget {
  final Color myColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const TextEntry({
    required this.myColor,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: myColor,
        fontWeight: fontWeight,
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  final double screenWidth;
  const DividerWidget(this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.92,
      child: const Divider(
        color: Color.fromARGB(255, 223, 241, 255),
        thickness: 1,
      ),
    );
  }
}

class DimensionInputRow extends StatelessWidget {
  final String labelText;
  final List<String> dropdownItems;

  const DimensionInputRow({
    required this.labelText,
    required this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 150.0,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 20.0),
        DropdownButtonExample(
          items: dropdownItems,
        ),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color myColor;

  const NextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.myColor = const Color.fromARGB(255, 45, 133, 185),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: myColor,
          minimumSize: const Size(double.infinity, 55.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 242, 244, 247),
          ),
        ),
      ),
    );
  }
}

class DisplayVentilationInprovement extends StatelessWidget {
  final String labelText;
  final List<String> dropdownItems;

  const DisplayVentilationInprovement({
    required this.labelText,
    required this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 150.0,
          height: 50.0,
          child: Container(
            alignment: Alignment.center, // Add this line
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(labelText),
          ),
        ),
        const SizedBox(width: 20.0),
        DropdownButtonExample(items: dropdownItems),
      ],
    );
  }
}

class OpeningImage extends StatelessWidget {
  final double screenWidth;
  final String filepath;
  final double borderRadius; // Optional parameter for customization

  const OpeningImage({
    Key? key,
    required this.screenWidth,
    required this.filepath,
    this.borderRadius = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        filepath,
        width: screenWidth * 0.90,
        fit: BoxFit.cover, // Adjust fit as needed
      ),
    );
  }
}
