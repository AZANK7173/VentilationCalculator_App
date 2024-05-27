import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class InputNat2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
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
                  _buildInstructionsContent(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionsContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText('Opening Characteristics'),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'We are now referring to the ',
            'facade toward the exterior. ',
            'Note that several typologies of opening could be available on the same wall (i.e. two different types of window or one window and one door).',
          ),
          const SizedBox(height: 20.0),
          _buildOpeningImage(screenWidth),
          const SizedBox(height: 20.0),
          _buildHyperLinkText(
              'What does “typologies of opening “ mean? ', 'Learn more'),
          const SizedBox(height: 20.0),
          _buildDivider(screenWidth),
          const SizedBox(height: 10.0),
          _buildContentText('Door/window number 1'),
        ],
      ),
    );
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

  Widget _buildHyperLinkText(String boldText1, String boldText2) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: boldText2,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 255, 109, 29),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch('https://www.google.com');
              },
          ),
        ],
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17.0,
        color: Color.fromARGB(255, 67, 150, 199),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRichTextContent(
      String normalText1, String boldText, String normalText2) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
            ),
          ),
          TextSpan(
            text: boldText,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: normalText2,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
            ),
          ),
        ],
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

  Widget _buildOpeningImage(double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        'assets/opening_natural_1.jpg',
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
    return ElevatedButton(
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
        'Next',
        style: TextStyle(
          color: Color.fromARGB(255, 242, 244, 247),
        ),
      ),
    );
  }
}
