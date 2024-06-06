import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final List<String> items;
  const DropdownButtonExample({
    super.key,
    required this.items,
  });

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.first;
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      //width: widget.dropdownWidth * screenWidth,
      child: DropdownButton<String>(
        value: dropdownValue,
        alignment: Alignment.center,
        underline: Container(),
        elevation: 16,
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  fontWeight:
                      FontWeight.normal), // Set the font weight to normal
            ),
          );
        }).toList(),
      ),
    );
  }
}


// class DropdownMenuExample extends StatefulWidget {
//   final double dropdownWidth;
//   final List<String> items;

//   const DropdownMenuExample({
//     super.key,
//     required this.dropdownWidth,
//     required this.items,
//   });

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = '';

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return DropdownMenu<String>(
//       width: screenWidth * widget.dropdownWidth,
//       initialSelection: widget.items.first,
//       onSelected: (String? value) {
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       dropdownMenuEntries:
//           widget.items.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }