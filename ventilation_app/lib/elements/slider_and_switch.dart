import 'package:flutter/material.dart';

class Slider0To100 extends StatefulWidget {
  final String dragText;

  Slider0To100({required this.dragText});

  @override
  _Slider0To100State createState() => _Slider0To100State();
}

class _Slider0To100State extends State<Slider0To100> {
  double _value = 0;

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
          value: _value,
          min: 0,
          max: 100,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
          divisions: 100,
          label: '${_value.round()}%',
        ),
      ],
    );
  }
}

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
          crossAxisAlignment: CrossAxisAlignment.center, // Add this line
          children: [
            Text(
              widget.switchText,
              style: const TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 102, 112, 133),
              ),
            ),
            const SizedBox(width: 60.0),
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
