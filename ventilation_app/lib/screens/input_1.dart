import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';

class Input1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
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
                  _buildInstructionRow(),
                  const SizedBox(height: 20.0),
                  _buildDivider(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildSettingSelectionRow(),
                  const SizedBox(height: 10.0),
                  const DropdownMenuExample(
                    dropdownWidth: 0.85,
                    items: ['Residential Setting', 'Hospital Setting'],
                  ),
                  const SizedBox(height: 30.0),
                  _buildRoomDimensionsSection(),
                  const SizedBox(height: 15.0),
                  _buildRoomImage(screenWidth),
                  const SizedBox(height: 15.0),
                  _buildEnterDimensionsLabel(),
                  const SizedBox(height: 15.0),
                  _buildDimensionInputRow(
                      'Length', ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 10.0),
                  _buildDimensionInputRow(
                      'Height', ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 10.0),
                  _buildDimensionInputRow(
                      'Width', ['meters', 'inches', 'centimeters']),
                  const SizedBox(height: 20.0),
                  _buildVentilationTypeLabel(),
                  const SizedBox(height: 10.0),
                  _buildVentilationTypeButtons(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildNextButton(context),
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
        const SizedBox(width: 20.0),
        const Text(
          'Hey, there',
          style: TextStyle(
            fontSize: 30.0,
            color: Color.fromARGB(255, 7, 59, 91),
            fontWeight: FontWeight.bold,
          ),
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

  Widget _buildInstructionRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        Text(
          'Let’s calculate your room ventilation!',
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 7, 59, 91),
          ),
        ),
      ],
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

  Widget _buildSettingSelectionRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        Text(
          'Select your setting of interest',
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 7, 59, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRoomDimensionsSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        Text(
          'What are the room\'s dimensions?',
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 7, 59, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Widget _buildEnterDimensionsLabel() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        Text(
          'Enter dimensions',
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 102, 112, 133),
          ),
        ),
      ],
    );
  }

  Widget _buildDimensionInputRow(String labelText, List<String> dropdownItems) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20.0),
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

  Widget _buildVentilationTypeLabel() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        Text(
          'How is your room ventilated?',
          style: TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 7, 59, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

  Widget _buildNextButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/input_nat_2');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 45, 133, 185),
          minimumSize: const Size(350, 55.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Color.fromARGB(255, 242, 244, 247),
          ),
        ),
      ),
    );
  }
}
