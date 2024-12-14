import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class DimensionInputRow extends StatefulWidget {
  final String labelText;
  final List<String> dropdownItems;
  final String? initialNumber; // New field for initial number
  final String? initialDropdownValue; // New field for initial dropdown value
  final Function(String?, String?)? onChanged; // Callback for the parent

  const DimensionInputRow({
    super.key,
    required this.labelText,
    required this.dropdownItems,
    this.initialNumber, // Initialize the number
    this.initialDropdownValue, // Initialize the dropdown value
    this.onChanged,
  });

  @override
  DimensionInputRowState createState() => DimensionInputRowState();
}

class DimensionInputRowState extends State<DimensionInputRow> {
  String? selectedDimensionValue;
  String? enteredNumber;

  @override
  void initState() {
    super.initState();
    // Set initial values from the widget's properties
    selectedDimensionValue = widget.initialDropdownValue;
    enteredNumber = widget.initialNumber;
  }

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
              labelText: widget.labelText,
            ),
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: enteredNumber),
            onChanged: (value) {
              setState(() {
                enteredNumber = value;
              });
              // Notify parent whenever either value changes
              if (widget.onChanged != null) {
                widget.onChanged!(enteredNumber, selectedDimensionValue);
              }
            },
          ),
        ),
        const SizedBox(width: 20.0),
        Flexible(
          child: DropdownButtonFormField<String>(
            value: selectedDimensionValue,
            items: widget.dropdownItems.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedDimensionValue = value;
              });
              // Notify parent whenever either value changes
              if (widget.onChanged != null) {
                widget.onChanged!(enteredNumber, selectedDimensionValue);
              }
            },
          ),
        ),
      ],
    );
  }

  // Method to get both the number and the unit
  Map<String, String?> get dimensionData => {
        'number': enteredNumber,
        'unit': selectedDimensionValue,
      };
}

Map<String, bool> createUnitMap(String? unit) {
  return {
    'meters': unit == 'meters',
    'inches': unit == 'inches',
  };
}

Map<String, bool> createVentRateUnitMap(String? unit) {
  return {
    'l/s': unit == 'l/s',
    'm³/s': unit == 'm³/s',
    'm³/h': unit == 'm³/h',
    'ACH': unit == 'ACH',
    'CFM': unit == 'CFM',
  };
}

Map<String, bool> createWindSpeedUnitMap(String? unit) {
  return {
    'm/s': unit == 'm/s',
    'km/h': unit == 'km/h',
  };
}

Map<String, bool> createTempUnitMap(String? unit) {
  return {
    '°C': unit == '°C',
    '°F': unit == '°F',
  };
}

String getSelectedSetting(Map<String, bool> settings) {
  // Find the first key with a value of true, or default to null
  return settings.entries
      .firstWhere(
        (entry) => entry.value == true,
        orElse: () => MapEntry("No setting selected", false),
      )
      .key;
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
          minimumSize: const Size(double.infinity, 55.0),
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

class DisplayVentilationInprovement extends StatelessWidget {
  final String labelText;
  final List<String> dropdownItems;

  const DisplayVentilationInprovement({
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
          height: 50.0,
          child: Container(
            alignment: Alignment.center, // Add this line
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(labelText),
          ),
        ),
        const SizedBox(width: 20.0),
        //DropdownButtonExample(items: dropdownItems),
      ],
    );
  }
}

class OpeningImage extends StatelessWidget {
  final double screenWidth;
  final String filepath;
  final double borderRadius; // Optional parameter for customization

  const OpeningImage({
    Key? key,
    required this.screenWidth,
    required this.filepath,
    this.borderRadius = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        filepath,
        width: screenWidth * 0.90,
        fit: BoxFit.cover, // Adjust fit as needed
      ),
    );
  }
}

// second natural input screen

class CustomInputWidget extends StatefulWidget {
  final String inputText;
  final String? initialValue; // New attribute for initial value
  final Function(String)? onTextChanged; // Callback for text input change

  const CustomInputWidget({
    super.key,
    required this.inputText,
    this.initialValue,
    this.onTextChanged,
  });

  @override
  CustomInputWidgetState createState() => CustomInputWidgetState();
}

class CustomInputWidgetState extends State<CustomInputWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the initial value, if provided
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Assuming TextEntry is a custom widget you have created
        TextEntry(
          myColor: const Color.fromARGB(255, 102, 112, 133),
          text: widget.inputText,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 10.0),
        SizedBox(
          width: 60,
          height: 30,
          child: TextField(
            controller: _controller, // Attach the controller
            style: const TextStyle(
              fontSize: 12.0,
              height: 2.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 214, 220, 220),
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 37),
              isDense: true,
              labelText: '',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (widget.onTextChanged != null) {
                widget.onTextChanged!(value);
              }
            },
          ),
        ),
      ],
    );
  }

  String? get currentText => _controller.text;
}
