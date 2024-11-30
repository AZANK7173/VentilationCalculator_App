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

// Switcher widget for screen 4n-input_nat_2.dart and 5n-nat_wind_speed.dart
class Switcher extends StatefulWidget {
  final String switchText;
  Switcher({super.key, required this.switchText});
  @override
  SwitcherState createState() => SwitcherState();
}

class SwitcherState extends State<Switcher> {
  bool isSwitched = false;

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
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
  bool get isOn => isSwitched;
}
