import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ventilation_app/geolocation.dart';
import 'package:ventilation_app/weather.dart';

class NatTemperature extends StatelessWidget {
  final GlobalKey<DimensionInputRowState> _insideTempKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _outsideTempKey =
      GlobalKey<DimensionInputRowState>();

  final LocationService locationService = LocationService();
  final WeatherService weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Temperature Input',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_nat_2');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Ambient Temperature",
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
                      initialNumber: calculationState.tempIn,
                      initialDropdownValue:
                          getSelectedSetting(calculationState.unitTempIn),
                      labelText: 'Inside Temp',
                      dropdownItems: ['°C', '°F']),
                  const SizedBox(height: 20.0),

                  FutureBuilder<Position>(
                    future: locationService.getCurrentLocation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final position = snapshot.data!;
                        return FutureBuilder<Map<String, dynamic>>(
                          future: weatherService.getWeatherData(position),
                          builder: (context, weatherSnapshot) {
                            if (weatherSnapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (weatherSnapshot.hasError) {
                              return Center(child: Text('Error: ${weatherSnapshot.error}'));
                            } else if (weatherSnapshot.hasData) {
                              final weatherData = weatherSnapshot.data!;
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DimensionInputRow(
                                      key: _outsideTempKey,
                                      initialNumber: weatherData['main']['temp'].toString(),
                                      initialDropdownValue:
                                          getSelectedSetting(calculationState.unitTempOut),
                                      labelText: 'Outside Temp',
                                      dropdownItems: ['°C', '°F']
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Center(child: Text('No Data'));
                          },
                        );
                      }
                      return Center(child: Text('Unable to get location.'));
                    },
                  ),
                  const SizedBox(height: 50.0),
                  NextButton(
                    displayMessage:
                        "Invalid temperature values, please \n correct them before proceeding",
                    onPressed: () {
                      final dataInsideTemp =
                          _insideTempKey.currentState?.dimensionData;
                      final dataOutsideTemp =
                          _outsideTempKey.currentState?.dimensionData;

                      bool canProceed = false;

                      // Validate inside and outside temperature data
                      if (dataInsideTemp != null && dataOutsideTemp != null) {
                        final insideTemp = dataInsideTemp['number'] ?? '0';
                        final outsideTemp = dataOutsideTemp['number'] ?? '0';
                        if (isValidDouble(insideTemp, true) &&
                            isValidDouble(outsideTemp, true)) {
                          calculationState.updateTempIn(
                            insideTemp,
                            createTempUnitMap(dataInsideTemp['unit']),
                          );
                          calculationState.updateTempOut(
                            outsideTemp,
                            createTempUnitMap(dataOutsideTemp['unit']),
                          );
                          canProceed = true;
                        } else {
                          print(
                              'Invalid temperature value. Ensure both are numeric.');
                        }
                      } else {
                        print('Outside temperature data is missing.');
                      }

                      // Proceed to the results screen if all data is valid
                      if (canProceed) {
                        Navigator.of(context).pushNamed('/nat_results_single');
                      } else {
                        print("Cannot proceed, invalid data.");
                      }
                    },
                    text: 'See Result for Single Opening',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
