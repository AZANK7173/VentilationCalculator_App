import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/formulas.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';
import 'dart:math';

class NatResultsCross extends StatelessWidget {
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
        computerVentilationCross(calculationState), whoRecommendation);

    return MaterialApp(
      title: 'Results Page - Natural Ventilation Cross Sided',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/nat_wind_speed');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Cross Sided Results",
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
                    text: 'Cross sided ventilation',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  _buildRichTextContent(
                      'The tool shows the ',
                      'current ventilation rate ',
                      'and the maximum number of people the room can safely hold.'),
                  const SizedBox(height: 20.0),
                  OpeningImage(
                      screenWidth: screenWidth,
                      filepath: 'assets/cross_sided.png'),
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
                  _buildResult('Estimated Ventilation:',
                      computerVentilationCross(calculationState), 'l/s'),
                  _buildResultInt('WHO recommendation:', whoRecommendation,
                      'l/s per person'),
                  _buildResultInt('Possible Occupancy:', people, 'people'),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  MultiplyByInput(
                    multiplier: whoRecommendation,
                    ventilation: computerVentilationCross(calculationState),
                  ),
                  const SizedBox(height: 30.0),
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

double computerVentilationCross(CalculationState calculationState) {
  double windspeed = convertToMetersPerSecond(
      double.parse(calculationState.windspeed), calculationState.unitWindSpeed);

  double windowheight = convertToMeters(
      double.parse(calculationState.windowheight),
      calculationState.unitWindowHeight);

  double windowwidth = convertToMeters(
      double.parse(calculationState.windowwidth),
      calculationState.unitWindowWidth);

  double windowheight2 = convertToMeters(
      double.parse(calculationState.windowheight2),
      calculationState.unitWindowHeight2);

  double windowwidth2 = convertToMeters(
      double.parse(calculationState.windowwidth2),
      calculationState.unitWindowWidth2);

  double windowheight3 = convertToMeters(
      double.parse(calculationState.windowheight3),
      calculationState.unitWindowHeight3);

  double windowwidth3 = convertToMeters(
      double.parse(calculationState.windowwidth3),
      calculationState.unitWindowWidth3);

  int openingsnum = int.parse(calculationState.openingsnum);
  int openingsnum2 = int.parse(calculationState.openingsnum2);
  int openingsnum3 = int.parse(calculationState.openingsnum3);

  double openingpercent1 = calculationState.openpercentage;
  double openingpercent2 = calculationState.openpercentage2;
  double openingpercent3 = calculationState.openpercentage3;

  double totalOpening1 = calculateOpeningArea(
      windowwidth, windowheight, openingsnum, openingpercent1);

  double totalOpening2 = calculateOpeningArea(
      windowwidth2, windowheight2, openingsnum2, openingpercent2);

  double totalOpening3 = calculateOpeningArea(
      windowwidth3, windowheight3, openingsnum3, openingpercent3);

  double minOpening = min(totalOpening1, min(totalOpening2, totalOpening3));

  return 0.65 * windspeed * minOpening * 1000;
}
