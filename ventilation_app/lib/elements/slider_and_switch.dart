import 'package:flutter/material.dart';

// Slider widget for screen 4n-input_nat_2.dart
class Slider0To100 extends StatefulWidget {
  final String dragText;

  Slider0To100({super.key, required this.dragText});

  @override
  Slider0To100State createState() => Slider0To100State();
}

class Slider0To100State extends State<Slider0To100> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Add this line
      children: [
        Text(
          widget.dragText,
          style: const TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 102, 112, 133),
          ),
        ),
        Slider(
          activeColor: const Color.fromARGB(255, 67, 150, 199),
          value: value,
          min: 0,
          max: 100,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
          },
          divisions: 10,
          label: '${value.round()}%',
        ),
      ],
    );
  }

  double get sliderValue => value;
}

// Switcher widget for screen
class Switcher extends StatefulWidget {
  final String switchText;
  Switcher({required this.switchText});
  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Add this line
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Add this line
          children: [
            Text(
              widget.switchText,
              style: const TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 102, 112, 133),
              ),
            ),
            const Spacer(), // Add this line
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
