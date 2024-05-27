import 'package:flutter/material.dart';

class BottomWhoMessage extends StatelessWidget {
  final Color myColor;

  const BottomWhoMessage({
    required this.myColor
  });

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
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'ⓘ We use formulas by the ',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: myColor,
                  ),
                ),
                TextSpan(
                  text: 'World Health Organization (WHO)',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: myColor,
                    fontWeight: FontWeight.bold, // Make this part bold
                  ),
                ),
                TextSpan(
                  text: ' to calculate ventilation rates.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: myColor,
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
