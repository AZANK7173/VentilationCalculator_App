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

bool isValidDouble(String? value, bool zeroAllowed) {
  if (value == null) {
    return false;
  } else if (value == '0' && !zeroAllowed) {
    return false;
  }
  final doubleRegex = RegExp(r'^\d+(\.\d+)?$'); // Matches valid doubles.
  return doubleRegex.hasMatch(value);
}

bool isValidInt(String? value, bool zeroAllowed) {
  if (value == null) {
    return false;
  } else if (value == '0' && !zeroAllowed) {
    return false;
  }
  final intRegex = RegExp(r'^\d+$'); // Matches valid integers.
  return intRegex.hasMatch(value);
}

class NextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color myColor;
  final String displayMessage;

  const NextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.myColor = const Color.fromARGB(255, 45, 133, 185),
    this.displayMessage = 'Button pressed!',
  }) : super(key: key);

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  String? displayText;

  void _handlePress() {
    setState(() {
      displayText = widget.displayMessage;
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (displayText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              displayText!,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
        Center(
          child: ElevatedButton(
            onPressed: _handlePress,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.myColor,
              minimumSize: const Size(double.infinity, 55.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Color.fromARGB(255, 242, 244, 247),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DisplayVentilationInprovement extends StatelessWidget {
  final String labelText;

  const DisplayVentilationInprovement({
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.0,
          height: 45.0,
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

class MultiplyByInput extends StatefulWidget {
  final int multiplier; // Accept the multiplier as an argument
  final double ventilation; // New argument for ventilation value

  const MultiplyByInput({
    Key? key,
    required this.multiplier,
    required this.ventilation,
  }) : super(key: key);

  @override
  _MultiplyByInputState createState() => _MultiplyByInputState();
}

class _MultiplyByInputState extends State<MultiplyByInput> {
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0; // To store the result of the calculation

  // Function to handle the input and update the result
  void _calculateResult(String value) {
    setState(() {
      // Parse the value, calculate the result, and subtract ventilation
      _result = double.tryParse(value) != null
          ? (double.parse(value) * widget.multiplier) - widget.ventilation
          : 0.0;
      _result = _result < 0 ? 0.0 : _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'How many people do you \n want to fit in the room?',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 102, 112, 133),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: 60,
              height: 30,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
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
                onChanged:
                    _calculateResult, // Call the calculation function on input change
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        DividerWidget(screenWidth),
        const TextEntry(
          myColor: Color.fromARGB(255, 102, 112, 133),
          text:
              'This is how much you need to improve the ventilation to meet WHO standards.',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 20.0),
        DisplayVentilationInprovement(
          labelText: '${_result.round()} l/s',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
