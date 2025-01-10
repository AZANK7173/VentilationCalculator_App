import 'package:flutter/material.dart';

class MecOrNatToggleButtons extends StatefulWidget {
  final bool initialNat; // New field for the initial selection
  final Function(bool)?
      onSelectionChanged; // Callback to notify parent of changes

  const MecOrNatToggleButtons({
    Key? key,
    this.initialNat = true, // Defaults to "Naturally"
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  MecOrNatToggleButtonsState createState() => MecOrNatToggleButtonsState();
}

class MecOrNatToggleButtonsState extends State<MecOrNatToggleButtons> {
  late List<bool> _selectedFruits; // Selection state
  final List<Widget> fruits = <Widget>[
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
  late bool nat; // Variable to store the selected option
  bool vertical = false;

  @override
  void initState() {
    super.initState();
    // Initialize state based on the initialNat value
    nat = widget.initialNat;
    _selectedFruits = [nat, !nat];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ToggleButtons(
        direction: vertical ? Axis.vertical : Axis.horizontal,
        onPressed: (int index) {
          setState(() {
            // Update the selection state
            for (int i = 0; i < _selectedFruits.length; i++) {
              _selectedFruits[i] = i == index;
            }
            // Update the value of nat
            nat = index == 0;

            // Notify parent widget of the selection change
            if (widget.onSelectionChanged != null) {
              widget.onSelectionChanged!(nat);
            }
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
