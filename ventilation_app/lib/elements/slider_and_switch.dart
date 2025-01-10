import 'package:flutter/material.dart';

// Slider widget for screen 4n-input_nat_2.dart
class Slider0To100 extends StatefulWidget {
  final String dragText;
  final double initialValue; // Initial value for the slider
  final Function(double)? onValueChanged; // Callback for value changes

  const Slider0To100({
    Key? key,
    required this.dragText,
    this.initialValue = 0.0, // Default to 0
    this.onValueChanged,
  }) : super(key: key);

  @override
  Slider0To100State createState() => Slider0To100State();
}

class Slider0To100State extends State<Slider0To100> {
  late double value; // Current value of the slider

  @override
  void initState() {
    super.initState();
    // Initialize the slider value based on the initial value
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          divisions: 10,
          label: '${value.round()}%',
          onChanged: (newValue) {
            setState(() {
              value = newValue; // Update the slider value
            });
            // Notify the parent widget of the value change
            if (widget.onValueChanged != null) {
              widget.onValueChanged!(value);
            }
          },
        ),
      ],
    );
  }

  // Getter method to expose the current slider value
  double get sliderValue => value;
}


// Switcher widget for screen 4n-input_nat_2.dart and 5n-nat_wind_speed.dart
class Switcher extends StatefulWidget {
  final String switchText;
  final bool initialValue; // Initial value for the switch
  final Function(bool)? onToggle; // Callback to notify parent widget of changes

  const Switcher({
    Key? key,
    required this.switchText,
    this.initialValue = false, // Default to "off"
    this.onToggle,
  }) : super(key: key);

  @override
  SwitcherState createState() => SwitcherState();
}

class SwitcherState extends State<Switcher> {
  late bool isSwitched; // Current state of the switch

  @override
  void initState() {
    super.initState();
    // Initialize the state based on the initial value
    isSwitched = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.switchText,
              style: const TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 102, 112, 133),
              ),
            ),
            const Spacer(),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value; // Update the state
                });
                // Notify the parent widget of the state change
                if (widget.onToggle != null) {
                  widget.onToggle!(isSwitched);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  // Getter method to expose the current switch state
  bool get isOn => isSwitched;
}
