import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final List<String> items;
  final String? initialValue; // New attribute for initial selected value

  const DropdownButtonExample({
    super.key,
    required this.items,
    this.initialValue,
  });

  @override
  DropdownButtonExampleState createState() => DropdownButtonExampleState();
}

class DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    // Use the provided initial value if it exists, otherwise default to the first item
    selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        alignment: Alignment.center,
        underline: Container(),
        elevation: 16,
        onChanged: (String? value) {
          // Update the selected value
          setState(() {
            selectedValue = value!;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          );
        }).toList(),
      ),
    );
  }

  String get dropValue => selectedValue;
}
