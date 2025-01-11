// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ventilation_app/elements/upper_navigation_bar.dart';
// import 'package:ventilation_app/elements/texts_and_buttons.dart';
// import 'package:ventilation_app/state_manager.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:ventilation_app/geolocation.dart';
// import 'package:ventilation_app/weather.dart';

// class NatWindSpeed extends StatelessWidget {
//   final GlobalKey<DimensionInputRowState> _windSpeedKey =
//       GlobalKey<DimensionInputRowState>();

//   final LocationService locationService = LocationService();
//   final WeatherService weatherService = WeatherService();

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     final calculationState = Provider.of<CalculationState>(context);

//     return MaterialApp(
//       title: 'Wind Speed Input',
//       home: Scaffold(
//         appBar: MyAppBar(
//           onPressed1: () {
//             Navigator.of(context).pushNamed('/input_nat_3');
//           },
//           onPressed2: () {
//             Navigator.of(context).pushNamed('/');
//           },
//           title: "Natural Wind Speed",
//         ),
//         backgroundColor: Colors.white,
//         body: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const TextEntry(
//                     myColor: Color.fromARGB(255, 255, 109, 29),
//                     text: 'Opening Characteristics - Wind Data',
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   const SizedBox(height: 20.0),
//                   const TextEntry(
//                       fontSize: 17.0,
//                       text: 'Wind Speed',
//                       myColor: Color.fromARGB(255, 67, 150, 199),
//                       fontWeight: FontWeight.bold),
//                   const SizedBox(height: 20.0),
//                   const TextEntry(
//                       fontSize: 15,
//                       text:
//                           'Enter the average wind speed at your building\'s  \n location. This should be the average value at the  \n building height, away from any obstructions.',
//                       myColor: Color.fromARGB(255, 102, 112, 133),
//                       fontWeight: FontWeight.normal),
//                   const SizedBox(height: 20.0),
//                   const TextEntry(
//                       fontSize: 13,
//                       text: 'ⓘ If no data is available, enter "1".',
//                       myColor: Color.fromARGB(255, 152, 162, 179),
//                       fontWeight: FontWeight.normal),
//                   const SizedBox(height: 20.0),

//                   FutureBuilder<Position>(
//                     future: locationService.getCurrentLocation(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                   Text('Location permission denied: enter manually the Wind Speed.'),
//                                   DimensionInputRow(
//                                 key: _windSpeedKey,
//                                 initialNumber: calculationState.windspeed,
//                                 initialDropdownValue:
//                                     getSelectedSetting(calculationState.unitWindSpeed),
//                                 labelText: 'Wind Speed',
//                                 dropdownItems: ['m/s', 'km/h']
//                                     ),
//                                   ],
//                                 ),
//                               );
//                       } else if (snapshot.hasData) {
//                         final position = snapshot.data!;
//                         FutureBuilder<Map<String, dynamic>>(
//                           future: weatherService.getWeatherData(position),
//                           builder: (context, weatherSnapshot) {
//                             if (weatherSnapshot.connectionState == ConnectionState.waiting) {
//                               return Center(child: CircularProgressIndicator());
//                             } else if (weatherSnapshot.hasError) {
//                               return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                   Text('Error: ${weatherSnapshot.error}'),
//                                   DimensionInputRow(
//                                 key: _windSpeedKey,
//                                 initialNumber: calculationState.windspeed,
//                                 initialDropdownValue:
//                                     getSelectedSetting(calculationState.unitWindSpeed),
//                                 labelText: 'Wind Speed',
//                                 dropdownItems: ['m/s', 'km/h']
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             } else if (weatherSnapshot.hasData) {
//                               final weatherData = weatherSnapshot.data!;
//                               return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                   Text('Wind Speed of station at ${weatherData['name']}, ${weatherData['sys']['country']}.'),
//                                   DimensionInputRow(
//                                       key: _windSpeedKey,
//                                       initialNumber: weatherData['wind']['speed'].toString(),
//                                       initialDropdownValue:
//                                           getSelectedSetting(calculationState.unitWindSpeed),
//                                       labelText: 'Wind Speed',
//                                       dropdownItems: ['m/s', 'km/h']
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }
//                             return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                   Text('No Data'),
//                                   DimensionInputRow(
//                                       key: _windSpeedKey,
//                                       initialNumber: calculationState.windspeed,
//                                       initialDropdownValue:
//                                           getSelectedSetting(calculationState.unitWindSpeed),
//                                       labelText: 'Wind Speed',
//                                       dropdownItems: ['m/s', 'km/h']
//                                     ),
//                                   ],
//                                 ),
//                               );
//                           },
//                         );
//                       }
//                       return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                             Text('Unable to get location.'),
//                             DimensionInputRow(
//                                 key: _windSpeedKey,
//                                 initialNumber: calculationState.windspeed,
//                                 initialDropdownValue:
//                                     getSelectedSetting(calculationState.unitWindSpeed),
//                                 labelText: 'Wind Speed',
//                                 dropdownItems: ['m/s', 'km/h']
//                               ),
//                             ],
//                           ),
//                         );
//                     },
//                   ),


//                   const SizedBox(height: 50.0),
//                   NextButton(
//                     displayMessage:
//                         "Invalid data. Wind can´t be \n null and must be a number",
//                     onPressed: () {
//                       final dataWindSpeed =
//                           _windSpeedKey.currentState?.dimensionData;
//                       bool canProceed = false;

//                       // Validate wind speed data
//                       if (dataWindSpeed != null) {
//                         final windSpeed = dataWindSpeed['number'] ?? '0';

//                         // Check if wind speed is a valid number
//                         if (isValidDouble(windSpeed, false)) {
//                           calculationState.updateWindSpeed(
//                             windSpeed,
//                             createWindSpeedUnitMap(dataWindSpeed['unit']),
//                           );
//                           canProceed = true;
//                         } else {
//                           print(
//                               'Invalid wind speed value. Ensure it is numeric.');
//                         }
//                       } else {
//                         print('Wind speed data is missing.');
//                       }

//                       // Proceed to the next screen if data is valid
//                       if (canProceed) {
//                         Navigator.of(context).pushNamed('/nat_results_cross');
//                       } else {
//                         print("Cannot proceed, invalid data.");
//                       }
//                     },
//                     text: 'See Results for Cross Ventilation',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ventilation_app/geolocation.dart';
import 'package:ventilation_app/weather.dart';

class NatWindSpeed extends StatefulWidget {
  @override
  _NatWindSpeedState createState() => _NatWindSpeedState();
}

class _NatWindSpeedState extends State<NatWindSpeed> {
  final GlobalKey<DimensionInputRowState> _windSpeedKey = GlobalKey<DimensionInputRowState>();
  final LocationService locationService = LocationService();
  final WeatherService weatherService = WeatherService();
  late Future<Position> _locationFuture;

  @override
  void initState() {
    super.initState();
    _locationFuture = locationService.getCurrentLocation();
  }

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
                    text: 'Opening Characteristics - Wind Data',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    fontSize: 17.0,
                    text: 'Wind Speed',
                    myColor: Color.fromARGB(255, 67, 150, 199),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    fontSize: 15,
                    text:
                        'Enter the average wind speed at your building\'s \n location. This should be the average value at the \n building height, away from any obstructions.',
                    myColor: Color.fromARGB(255, 102, 112, 133),
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    fontSize: 13,
                    text: 'ⓘ If no data is available, enter "1".',
                    myColor: Color.fromARGB(255, 152, 162, 179),
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 20.0),
                  FutureBuilder<Position>(
                    future: _locationFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Location permission denied: enter manually the Wind Speed.',
                            ),
                            DimensionInputRow(
                              key: _windSpeedKey,
                              initialNumber: calculationState.windspeed,
                              initialDropdownValue:
                                  getSelectedSetting(calculationState.unitWindSpeed),
                              labelText: 'Wind Speed',
                              dropdownItems: ['m/s', 'km/h'],
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        final position = snapshot.data!;
                        return FutureBuilder<Map<String, dynamic>>(
                          future: weatherService.getWeatherData(position),
                          builder: (context, weatherSnapshot) {
                            if (weatherSnapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (weatherSnapshot.hasError) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Error: ${weatherSnapshot.error}'),
                                  DimensionInputRow(
                                    key: _windSpeedKey,
                                    initialNumber: calculationState.windspeed,
                                    initialDropdownValue:
                                        getSelectedSetting(calculationState.unitWindSpeed),
                                    labelText: 'Wind Speed',
                                    dropdownItems: ['m/s', 'km/h'],
                                  ),
                                ],
                              );
                            } else if (weatherSnapshot.hasData) {
                              final weatherData = weatherSnapshot.data!;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wind Speed of station at ${weatherData['name']}, ${weatherData['sys']['country']}.',
                                  ),
                                  DimensionInputRow(
                                    key: _windSpeedKey,
                                    initialNumber: weatherData['wind']['speed'].toString(),
                                    initialDropdownValue:
                                        getSelectedSetting(calculationState.unitWindSpeed),
                                    labelText: 'Wind Speed',
                                    dropdownItems: ['m/s', 'km/h'],
                                  ),
                                ],
                              );
                            }
                            return const Text('No Data');
                          },
                        );
                      }
                      return const Text('Unable to get location.');
                    },
                  ),
                  const SizedBox(height: 50.0),
                  NextButton(
                    displayMessage:
                        "Invalid data. Wind can't be \n null and must be a number",
                    onPressed: () {
                      final dataWindSpeed = _windSpeedKey.currentState?.dimensionData;
                      bool canProceed = false;

                      if (dataWindSpeed != null) {
                        final windSpeed = dataWindSpeed['number'] ?? '0';
                        if (isValidDouble(windSpeed, false)) {
                          calculationState.updateWindSpeed(
                            windSpeed,
                            createWindSpeedUnitMap(dataWindSpeed['unit']),
                          );
                          canProceed = true;
                        } else {
                          print('Invalid wind speed value. Ensure it is numeric.');
                        }
                      } else {
                        print('Wind speed data is missing.');
                      }

                      if (canProceed) {
                        Navigator.of(context).pushNamed('/nat_results_cross');
                      } else {
                        print("Cannot proceed, invalid data.");
                      }
                    },
                    text: 'See Results for Cross Ventilation',
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
