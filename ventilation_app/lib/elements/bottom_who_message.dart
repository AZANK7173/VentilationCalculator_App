import 'package:flutter/material.dart';

class BottomWhoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 60.0,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: screenWidth * 0.90, // Set your desired width
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'ⓘ We use formulas by the ',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 16, 24, 40),
                  ),
                ),
                TextSpan(
                  text: 'World Health Organization (WHO)',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 16, 24, 40),
                    fontWeight: FontWeight.bold, // Make this part bold
                  ),
                ),
                TextSpan(
                  text: ' to calculate ventilation rates.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 16, 24, 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
