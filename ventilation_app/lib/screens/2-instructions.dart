import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/bottom_who_message.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';

void main() {
  runApp(const Instructions());
}

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instructions',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 7, 59, 91),
        body: Center(
          child: _buildInstructionsContent(context),
        ),
        bottomNavigationBar: const BottomWhoMessage(
          myColor: Color.fromARGB(255, 242, 244, 247),
        ),
      ),
    );
  }

  Widget _buildInstructionsContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 255, 109, 29),
              text: 'This tool estimates:',
              fontSize: 20,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 242, 244, 247),
              text: '1. The ventilation rate of your space.',
              fontSize: 15,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 10.0),
          _buildRichTextContent(
            '2. The maximum occupancy ',
            'based on WHO recommended requirements. Please note that recommended occupancy only considers ventilation rate; physical distancing should always be ensured.',
          ),
          const SizedBox(height: 10.0),
          _buildRichTextContent(
            '3. The potential ventilation gap, ',
            'considering: \n \u2022 Desired room occupancy. \n \u2022 Actual estimated ventilation rate.',
          ),
          const SizedBox(height: 30.0),
          NextButton(
              text: 'Got it!',
              onPressed: () {
                Navigator.of(context).pushNamed('/input_1');
              },
              myColor: const Color.fromARGB(255, 255, 109, 29)),
        ],
      ),
    );
  }

  Widget _buildRichTextContent(String boldText, String normalText) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldText,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 242, 244, 247),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: normalText,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 242, 244, 247),
            ),
          ),
        ],
      ),
    );
  }
}
