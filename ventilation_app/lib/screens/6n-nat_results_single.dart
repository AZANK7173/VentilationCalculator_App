import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class NatResultsSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Results Page - Natural Ventilation',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/nat_wind_speed');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Single Sided Results",
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextEntry(
                    myColor: Color.fromARGB(255, 255, 109, 29),
                    text: 'Single sided ventilation',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  Text("WIND NUM: ${calculationState.windspeed}",
                      style: const TextStyle(fontSize: 24)),
                  Text("WIND UNIT: ${calculationState.unitWindSpeed}",
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 20.0),
                  Text("Checked Side of Room: ${calculationState.sideofroom}",
                      style: const TextStyle(fontSize: 24)),
                  _buildRichTextContent(
                      'The tool automatically calculates the ',
                      'current ventilation rate ',
                      'based on your input.'),
                  const SizedBox(height: 20.0),
                  _buildRichTextContent(
                      'It shows the ',
                      'maximum number of people ',
                      'the room can accommodate with the current ventilation rate.'),
                  const SizedBox(height: 20.0),
                  OpeningImage(
                      screenWidth: screenWidth,
                      filepath: 'assets/single_sided.png'),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      text:
                          'Note: This is based on ventilation only. You still need to maintain physical distancing.',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildResult('Estimated Ventilation:', 0, 'I/s'),
                  _buildResult('WHO recommendation:', 0, 'I/s'),
                  _buildResult('Possible Occupancy:', 0, 'people'),
                  const SizedBox(height: 10.0),
                  _buildAccomodatePeopleButton(context),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      text:
                          'You need this much more ventilation for your desired number of people:',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 20.0),
                  const DisplayVentilationInprovement(
                    labelText: '[Calculated Value]',
                    dropdownItems: ['I/s', 'm³/s'],
                  ),
                  const SizedBox(height: 30.0),
                  NextButton(
                    text: 'Proceed to Cross Ventilation',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/nat_results_cross');
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

  Widget _buildResult(String boldText, int number, String unit) {
    return Row(
      children: [
        TextEntry(
          myColor: const Color.fromARGB(255, 102, 112, 133),
          text: boldText,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
        const SizedBox(width: 5.0),
        Text(
          '${number.toString()} $unit',
          style: const TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 102, 112, 133),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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

  Widget _buildAccomodatePeopleButton(BuildContext context) {
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
          '+ Accomodate more people',
          style: TextStyle(
            color: Color.fromARGB(255, 45, 133, 185),
          ),
        ),
      ),
    );
  }
}
