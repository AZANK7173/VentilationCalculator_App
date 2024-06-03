import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';

class InputMec2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Input Mechanical 2',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_1');
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
                  _buildInstructionsContent(context),
                  const SizedBox(height: 20.0),
                  _buildAddNewWindowButton(context),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'Select your setting of interest',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 10.0),
                  const DropdownMenuExample(
                    dropdownWidth: 0.85,
                    items: ['Healthcare', 'Residential', 'Non-residential'],
                  ),
                  const SizedBox(height: 30.0),
                  NextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/nat_wind_speed');
                    },
                    text: 'Next',
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

  Widget _buildInstructionsContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextEntry(
            myColor: Color.fromARGB(255, 255, 109, 29),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            text: 'Mechanical ventilation system characteristics',
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'Now, we will need you to ',
            'find the ventilation rate ',
            'on your system. ',
          ),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '•  Check your system\'s manual for the airflow rates.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '•  If you don\'t have the ACH value, follow these steps:',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '     •  Look at the technical drawing of the system.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  '     •  Enter the largest value between inlet and outlet vents.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  '     •  For multiple inlets/outlets, add their values together.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '     •  Use the drop-down menu to select the unit.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20.0),
          _buildOpeningImage(screenWidth, 'assets/mecanical_manual.jpg'),
          const SizedBox(height: 20.0),
          _buildExampleString(
              'Example: ', 'Total ventilation rate = A + B + C + D + E + F'),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: 'Ventilation rate',
              fontSize: 17,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 10.0),
          const DimensionInputRow(
              labelText: '', dropdownItems: ['I/s', 'm³/s']),
        ],
      ),
    );
  }

  Widget _buildExampleString(String boldText1, String normalText1) {
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
            text: normalText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
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

  Widget _buildInput1(String inputText) {
    return Row(
      children: [
        TextEntry(
          myColor: const Color.fromARGB(255, 102, 112, 133),
          text: inputText,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 10.0),
        const Expanded(
          child: SizedBox(
            height: 30,
            child: TextField(
              style:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 214, 220, 220)),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 37),
                isDense: true,
                labelText: '',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildOpeningImage(double screenWidth, String filepath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Image.asset(
      filepath,
      width: screenWidth * 0.90,
    ),
  );
}

Widget _buildAddNewWindowButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        //TODO add new window
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        minimumSize: const Size(350, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 45, 133, 185),
          ),
        ),
      ),
      child: const Text(
        'Calculate manually',
        style: TextStyle(
          color: Color.fromARGB(255, 45, 133, 185),
        ),
      ),
    ),
  );
}
