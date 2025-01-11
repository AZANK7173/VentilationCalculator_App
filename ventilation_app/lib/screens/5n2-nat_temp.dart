import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ventilation_app/geolocation.dart';
import 'package:ventilation_app/weather.dart';

class NatTemperature extends StatefulWidget {
  @override
  _NatTemperatureState createState() => _NatTemperatureState();
}

class _NatTemperatureState extends State<NatTemperature> {
  final GlobalKey<DimensionInputRowState> _insideTempKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _outsideTempKey =
      GlobalKey<DimensionInputRowState>();

  final LocationService locationService = LocationService();
  final WeatherService weatherService = WeatherService();

  Position? _currentPosition;
  Map<String, dynamic>? _weatherData;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchLocationAndWeather();
  }

  Future<void> _fetchLocationAndWeather() async {
    try {
      final position = await locationService.getCurrentLocation();
      setState(() {
        _currentPosition = position;
      });

      final weatherData = await weatherService.getWeatherData(position);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

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
                  const TextEntry(
                    fontSize: 15,
                    text:
                        'Please Enter the temperature data for the location of the building as well as the overall temperature inside the room.',
                    myColor: Color.fromARGB(255, 102, 112, 133),
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                    key: _insideTempKey,
                    initialNumber: calculationState.tempIn,
                    initialDropdownValue:
                        getSelectedSetting(calculationState.unitTempIn),
                    labelText: 'Inside Temp',
                    dropdownItems: ['°C', '°F'],
                  ),
                  const SizedBox(height: 20.0),
                  _buildOutsideTemperature(calculationState),
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

  Widget _buildOutsideTemperature(CalculationState calculationState) {
    if (_errorMessage != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Location permission denied or error occurred: enter manually the Outside Temperature.',
          ),
          const SizedBox(height: 10.0),
          DimensionInputRow(
            key: _outsideTempKey,
            initialNumber: calculationState.tempout,
            initialDropdownValue:
                getSelectedSetting(calculationState.unitTempOut),
            labelText: 'Outside Temp',
            dropdownItems: ['°C', '°F'],
          ),
        ],
      );
    }

    if (_currentPosition == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (_weatherData != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Outside Temperature of station at ${_weatherData!['name']}, ${_weatherData!['sys']['country']}.'),
          const SizedBox(height: 10.0),
          DimensionInputRow(
            key: _outsideTempKey,
            initialNumber: _weatherData!['main']['temp'].toString(),
            initialDropdownValue:
                getSelectedSetting(calculationState.unitTempOut),
            labelText: 'Outside Temp',
            dropdownItems: ['°C', '°F'],
          ),
        ],
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}
