import 'package:flutter/material.dart';
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
        DropdownMenuExample(
          dropdownWidth: 0.4,
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
          minimumSize: const Size(350, 55.0),
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
