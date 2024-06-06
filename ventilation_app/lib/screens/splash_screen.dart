import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/bottom_who_message.dart';

// Constants for spacing and colors
const double spacing80 = 80.0;
const double spacing50 = 50.0;
const double spacing20 = 20.0;
const double spacing10 = 10.0;
const Color primaryColor = Color.fromARGB(255, 7, 59, 91);
const Color accentColor = Color.fromARGB(255, 255, 109, 29);
const Color buttonColor = Color.fromARGB(255, 45, 133, 185);
const Color buttonTextColor = Color.fromARGB(255, 242, 244, 247);
const Color textColor = Color.fromARGB(255, 16, 24, 40);

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: spacing80),
              _buildImage(screenHeight),
              const SizedBox(height: spacing20),
              _buildWelcomeText(),
              const SizedBox(height: spacing10),
              _buildAppNameText(),
              const SizedBox(height: spacing50),
              _buildDescriptionText(screenWidth),
              const SizedBox(height: spacing20),
              _buildStartButton(context),
            ],
          ),
        ),
        bottomNavigationBar: const BottomWhoMessage(myColor: textColor),
      ),
    );
  }

  Widget _buildImage(double screenHeight) {
    return Image.asset(
      'assets/entry.jpg',
      width: screenHeight * 0.35,
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'Welcome to the',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  Widget _buildAppNameText() {
    return const Text(
      'Ventilation Calculator',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        color: accentColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescriptionText(double screenWidth) {
    return Container(
      width: 0.85 * screenWidth,
      child: const Text(
        'This calculator helps you figure out how well your space is ventilated. Good ventilation is important to avoid diseases.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/second');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(350, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        "Let's get started",
        style: TextStyle(
          color: buttonTextColor,
        ),
      ),
    );
  }
}
