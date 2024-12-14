import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/formulas.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';
import 'dart:math';

class NatResultsSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int people;
    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Results Page - Natural Ventilation',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/nat_temperature');
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
                  _buildResult('Estimated Ventilation:',
                      computerVentilationSingle(calculationState), 'l/s'),
                  ...[
                    if (calculationState.settingOfInterest['hospital'] ==
                        true) ...[
                      _buildResult('WHO recommendation:', 60, 'l/s per person'),
                      (() {
                        people = computeEstimatedOccupancy(
                            computerVentilationSingle(calculationState), 60);
                        return _buildResultInt(
                            'Possible Occupancy:', people, 'people');
                      })(), // Use a closure to compute and include the widget.
                    ] else ...[
                      _buildResult('WHO recommendation:', 10, 'l/s per person'),
                      (() {
                        people = computeEstimatedOccupancy(
                            computerVentilationSingle(calculationState), 10);
                        return _buildResultInt(
                            'Possible Occupancy:', people, 'people');
                      })(), // Use a closure here as well.
                    ],
                  ],
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
                    dropdownItems: ['l/s', 'm³/s'],
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

double computerVentilationSingle(CalculationState calculationState) {
  double temperatureIn = convertTemperature(
      double.parse(calculationState.tempIn), calculationState.unitTempIn);
  double temperatureOut = convertTemperature(
      double.parse(calculationState.tempout), calculationState.unitTempOut);

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

  int openingsnum = int.parse(calculationState.openingsnum);
  int openingsnum2 = int.parse(calculationState.openingsnum2);

  double openingpercent1 = calculationState.openpercentage;
  double openingpercent2 = calculationState.openpercentage2;

  double totalOpening1 = calculateOpeningArea(
      windowwidth, windowheight, openingsnum, openingpercent1);

  double totalOpening2 = calculateOpeningArea(
      windowwidth2, windowheight2, openingsnum2, openingpercent2);

  double minOpening = min(totalOpening1, totalOpening2);

  double minOpeningHeight =
      (minOpening == totalOpening1) ? windowheight : windowheight2;

  double result = 0.25 *
      minOpening *
      sqrt(9.81 *
          (minOpeningHeight * (temperatureOut - temperatureIn)) /
          temperatureIn) *
      1000;

  print('temperatureIn: $temperatureIn');
  print('temperatureOut: $temperatureOut');
  print('windowheight: $windowheight');
  print('windowwidth: $windowwidth');
  print('windowheight2: $windowheight2');
  print('windowwidth2: $windowwidth2');
  print('openingsnum: $openingsnum');
  print('openingsnum2: $openingsnum2');
  print('openingpercent1: $openingpercent1');
  print('openingpercent2: $openingpercent2');
  print('totalOpening1: $totalOpening1');
  print('totalOpening2: $totalOpening2');
  print('minOpening: $minOpening');
  print('minOpeningHeight: $minOpeningHeight');
  print('result: $result');

  return result;
}
