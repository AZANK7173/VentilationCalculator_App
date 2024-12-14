import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/formulas.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class MecResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int people;

    final calculationState = Provider.of<CalculationState>(context);
    int whoRecommendation =
        calculationState.settingOfInterest['Hospital Setting'] == true
            ? 60
            : 10;
    people = computeEstimatedOccupancy(
        computerVentilationMecanical(calculationState), whoRecommendation);

    return MaterialApp(
      title: 'Results Page - Mec Ventilation',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_mech_2');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Ventilation Results",
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
                    text: 'Healthcare Settings',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  _buildRichTextContent('The ', 'Air Changes per Hour (ACH) ',
                      'value shows how many times the air in your room is completely replaced with outdoor air in one hour. Here\'s what we found:'),
                  const SizedBox(height: 20.0),
                  _buildRichTextContent('a )The ', 'current ventilation ',
                      'based on the data provided.'),
                  const SizedBox(height: 20.0),
                  _buildRichTextContent(
                      'b) How your ventilation compares to WHO\'s ',
                      'recommended levels.',
                      ''),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'Actual ventilation estimate',
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 20.0),
                  _buildResult('Estimated Ventilation:',
                      computerVentilationMecanical(calculationState), 'l/s'),
                  _buildResultInt('WHO recommendation:', whoRecommendation,
                      'l/s per person'),
                  _buildResultInt('Possible Occupancy:', people, 'people'),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 30.0),
                  MultiplyByInput(
                    multiplier: whoRecommendation,
                    ventilation: computerVentilationMecanical(calculationState),
                  ),
                  NextButton(
                    text: 'Restart',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
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

  Widget _buildResult(String boldText, double number, String unit) {
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

  Widget _buildResultInt(String boldText, int number, String unit) {
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
}

double computerVentilationMecanical(CalculationState calculationState) {
  double roomheight = convertToMeters(
      double.parse(calculationState.height), calculationState.unitHeight);
  double roomwidth = convertToMeters(
      double.parse(calculationState.width), calculationState.unitWidth);
  double roomlength = convertToMeters(
      double.parse(calculationState.lenght), calculationState.unitLeght);

  double roomVolume = roomlength * roomwidth * roomheight;

  double flow1 = convertFlowRate(double.parse(calculationState.ventrate),
      calculationState.unitVentRate, roomVolume);

  double flow2 = convertFlowRate(double.parse(calculationState.ventrate2),
      calculationState.unitVentRate2, roomVolume);

  double flow3 = convertFlowRate(double.parse(calculationState.ventrate3),
      calculationState.unitVentRate3, roomVolume);

  double flow4 = convertFlowRate(double.parse(calculationState.ventrate4),
      calculationState.unitVentRate4, roomVolume);

  List<double> flows =
      [flow1, flow2, flow3, flow4].where((flow) => flow != 0).toList();
  double totalFlow = flows.isNotEmpty ? flows.reduce((a, b) => a + b) : 0;

  return totalFlow;
}
