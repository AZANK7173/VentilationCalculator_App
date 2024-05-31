import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';

class NatResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                    text: 'Results',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    fontSize: 17.0,
                    text: 'For Single Sided Ventilation',
                    myColor: Color.fromARGB(255, 67, 150, 199),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  _buildResult('Estimated Ventilation:', 0, 'I/s'),
                  _buildResult('WHO recommendation:', 0, 'I/s'),
                  _buildResult('Possible Occupancy:', 0, 'people'),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    fontSize: 17.0,
                    text: 'For Cross Sided Ventilation',
                    myColor: Color.fromARGB(255, 67, 150, 199),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  _buildResult('Estimated Ventilation:', 0, 'I/s'),
                  _buildResult('WHO recommendation:', 0, 'I/s'),
                  _buildResult('Possible Occupancy:', 0, 'people'),
                  const SizedBox(height: 50.0),
                  NextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    },
                    text: 'See Results',
                  ),
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
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 5.0),
        Text(
          '${number.toString()} $unit',
          style: const TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 102, 112, 133),
          ),
        ),
      ],
    );
  }
}
