import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class NatWindSpeed extends StatelessWidget {
  final GlobalKey<DimensionInputRowState> _windSpeedKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _insideTempKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _outsideTempKey =
      GlobalKey<DimensionInputRowState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Wind Speed Input',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_nat_3');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Natural Wind Speed",
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
                    text: 'Opening Characteristics - Temperature Data',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      fontSize: 17.0,
                      text: 'Temperature Data',
                      myColor: Color.fromARGB(255, 67, 150, 199),
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      fontSize: 15,
                      text:
                          'Please Enter the temperature data for the location of the building as well as the overall temperature inside the room.',
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      fontSize: 13,
                      text: 'ⓘ If no data is available, enter "1".',
                      myColor: Color.fromARGB(255, 152, 162, 179),
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _insideTempKey,
                      labelText: 'Inside Temp', dropdownItems: ['°C', '°F']),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _outsideTempKey,
                      labelText: 'Outside Temp', dropdownItems: ['°C', '°F']),
                  const SizedBox(height: 50.0),
                  //
                  const TextEntry(
                      fontSize: 17.0,
                      text: 'Wind Speed',
                      myColor: Color.fromARGB(255, 67, 150, 199),
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      fontSize: 15,
                      text:
                          'Enter the average wind speed at your building\'s  \n location. This should be the average value at the  \n building height, away from any obstructions.',
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      fontSize: 13,
                      text: 'ⓘ If no data is available, enter "1".',
                      myColor: Color.fromARGB(255, 152, 162, 179),
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _windSpeedKey,
                      labelText: 'Wind Speed',
                      dropdownItems: ['m/s', 'km/h']),
                  const SizedBox(height: 50.0),
                  NextButton(
                    onPressed: () {
                      final dataInsideTemp =
                          _insideTempKey.currentState?.dimensionData;
                      
                      if (dataInsideTemp != null) {
                        calculationState.updateTempIn(
                          dataInsideTemp['number'] ?? '0',
                          createTempUnitMap(dataInsideTemp['unit']),
                        );
                      } else {
                        print('One or more dimensions are missing.');
                      }

                      final dataOutsideTemp =
                          _outsideTempKey.currentState?.dimensionData;

                      if (dataOutsideTemp != null) {
                        calculationState.updateTempOut(
                          dataOutsideTemp['number'] ?? '0',
                          createTempUnitMap(dataOutsideTemp['unit']),
                        );
                      } else {
                        print('One or more dimensions are missing.');
                      }

                      final dataWindSpeed =
                          _windSpeedKey.currentState?.dimensionData;

                      if (dataWindSpeed != null) {
                        calculationState.updateWindSpeed(
                          dataWindSpeed['number'] ?? '0',
                          createWindSpeedUnitMap(dataWindSpeed['unit']),
                        );
                      } else {
                        print('One or more dimensions are missing.');
                      }

                      Navigator.of(context).pushNamed('/nat_results_single');
                    },
                    text: 'See Results',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
