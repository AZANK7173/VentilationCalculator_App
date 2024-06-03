import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';

class Input1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/second');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  _buildGreetingRow(screenHeight),
                  const SizedBox(height: 10.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'Let’s calculate your room ventilation!',
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    myColor: Color.fromARGB(255, 7, 59, 91),
                    text: 'Select your setting of interest',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  const DropdownMenuExample(
                    dropdownWidth: 0.85,
                    items: ['Residential Setting', 'Hospital Setting'],
                  ),
                  const SizedBox(height: 30.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'What are the room\'s dimensions?',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 15.0),
                  _buildRoomImage(screenWidth),
                  const SizedBox(height: 15.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      text: 'Enter dimensions',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 15.0),
                  const DimensionInputRow(
                      labelText: 'Length',
                      dropdownItems: ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 10.0),
                  const DimensionInputRow(
                      labelText: 'Height',
                      dropdownItems: ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 10.0),
                  const DimensionInputRow(
                      labelText: 'Width',
                      dropdownItems: ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    text: 'How is your room ventilated?',
                    fontSize: 15.0,
                    myColor: Color.fromARGB(255, 7, 59, 91),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  _buildVentilationTypeButtons(screenWidth),
                  const SizedBox(height: 20.0),
                  NextButton(
                    text: 'Next (Natural)',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/input_nat_2');
                    },
                  ),
                  const SizedBox(height: 20.0),
                  NextButton(
                    text: 'Next (Mechanical)',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/input_mech_2');
                    },
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingRow(double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TextEntry(
          text: 'Hey, there',
          fontSize: 30.0,
          myColor: Color.fromARGB(255, 7, 59, 91),
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 5.0),
        Image.asset(
          'assets/waving_hand.png',
          width: screenHeight * 0.03,
          height: screenHeight * 0.03,
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  Widget _buildRoomImage(double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        'assets/room.jpg',
        width: screenWidth * 0.90,
      ),
    );
  }

  Widget _buildVentilationTypeButtons(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20.0),
        _buildVentilationTypeButton(
          text: 'Naturally \nIntentional building openings',
          backgroundColor: const Color.fromARGB(255, 67, 150, 199),
          textColor: Colors.white,
          screenWidth: screenWidth,
        ),
        const SizedBox(width: 15.0),
        _buildVentilationTypeButton(
          text: 'Mechanically \nPowered fans or blowers',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          screenWidth: screenWidth,
        ),
      ],
    );
  }

  Widget _buildVentilationTypeButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required double screenWidth,
  }) {
    return TextButton(
      onPressed: () {
        // Change button color on click
        // (consider using a state management solution for complex scenarios)
        print('Button Clicked!'); // Replace with your desired action
      },
      style: TextButton.styleFrom(
        minimumSize: const Size(80, 80),
        fixedSize: Size(screenWidth * 0.4, screenWidth * 0.4),
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: backgroundColor,
        overlayColor: Colors.blueAccent,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text.split(' ')[0] + '\n',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: text.split('\n')[1],
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
