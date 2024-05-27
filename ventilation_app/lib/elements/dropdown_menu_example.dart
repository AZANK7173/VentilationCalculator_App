import 'package:flutter/material.dart';
class DropdownMenuExample extends StatefulWidget {
  final double dropdownWidth;
  final List<String> items;

  const DropdownMenuExample({
    super.key,
    required this.dropdownWidth,
    required this.items,
  });

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return DropdownMenu<String>(
      width: screenWidth * widget.dropdownWidth,
      initialSelection: widget.items.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: widget.items.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}