import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';

class NatWindSpeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Wind Speed Input',
      home: Scaffold(
        appBar: MyAppBar(),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleText('Opening Characteristics'),
                  const SizedBox(height: 20.0),
                  Switcher(
                    switchText:
                        'Are there openings available in other \n side of the room? ',
                  ),
                  const SizedBox(height: 20.0),
                  _buildDivider(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildContentText(
                      'Wind Speed',
                      const Color.fromARGB(255, 67, 150, 199),
                      17,
                      FontWeight.bold),
                  const SizedBox(height: 20.0),
                  _buildContentText(
                      'Enter the average wind speed at your building\'s  \n location. This should be the average value at the  \n building height, away from any obstructions.',
                      const Color.fromARGB(255, 102, 112, 133),
                      15,
                      FontWeight.normal),
                  const SizedBox(height: 20.0),
                  _buildContentText(
                      'ⓘ If no data is available, enter "1".',
                      const Color.fromARGB(255, 152, 162, 179),
                      13,
                      FontWeight.normal),
                  const SizedBox(height: 20.0),
                  _buildDimensionInputRow('Wind Speed', ['m/s', 'km/h']),
                  const SizedBox(height: 50.0),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTitleText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 20.0,
      color: Color.fromARGB(255, 255, 109, 29),
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildDivider(double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.92,
    child: const Divider(
      color: Color.fromARGB(255, 223, 241, 255),
      thickness: 1,
    ),
  );
}

Widget _buildContentText(
    String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Widget _buildDimensionInputRow(String labelText, List<String> dropdownItems) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 150.0,
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
      const SizedBox(width: 20.0),
      DropdownMenuExample(
        dropdownWidth: 0.4,
        items: dropdownItems,
      ),
    ],
  );
}

Widget _buildNextButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/second');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 133, 185),
        minimumSize: const Size(350, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'See Results',
        style: TextStyle(
          color: Color.fromARGB(255, 242, 244, 247),
        ),
      ),
    ),
  );
}
