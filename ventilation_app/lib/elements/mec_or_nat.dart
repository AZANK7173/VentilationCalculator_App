import 'package:flutter/material.dart';

class MecOrNatToggleButtons extends StatefulWidget {
  const MecOrNatToggleButtons({Key? key}) : super(key: key);

  @override
  MecOrNatToggleButtonsState createState() => MecOrNatToggleButtonsState();
}

class MecOrNatToggleButtonsState extends State<MecOrNatToggleButtons> {
  final List<bool> _selectedFruits = <bool>[
    true,
    false
  ]; // Initial selection state
  List<Widget> fruits = <Widget>[
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Naturally',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Intentional building',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        Text(
          'openings',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Mechanically',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Powered fans',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        Text(
          'or blowers',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    ),
  ];
  bool vertical = false;
  bool nat = true; // Variable to store the selected option

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ToggleButtons(
        direction: vertical ? Axis.vertical : Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < _selectedFruits.length; i++) {
              _selectedFruits[i] = i == index;
            }
            // Update the value of nat based on the selected button
            nat = index == 0;
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: const Color.fromARGB(255, 67, 150, 199),
        selectedColor: Colors.white,
        fillColor: const Color.fromARGB(255, 67, 150, 199),
        color: const Color.fromARGB(255, 29, 41, 57),
        constraints: BoxConstraints(
          minHeight: screenWidth * 0.4,
          minWidth: screenWidth * 0.4,
        ),
        isSelected: _selectedFruits,
        children: fruits,
      ),
    );
  }

  // Getter method for nat variable
  bool get isNat => nat;
}
