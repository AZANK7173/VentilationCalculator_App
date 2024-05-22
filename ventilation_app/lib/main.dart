import 'package:flutter/material.dart';

// width = 393.0
// height = 753.0

void main() {
  runApp(Instructions());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    debugPrint('Screen Height: $screenHeight');
    debugPrint('Screen Width: $screenWidth');

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        backgroundColor: Colors.white, // Set white background
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              const SizedBox(
                  height: 80.0), // Add spacing between text and button
              Image.asset(
                'assets/entry.jpg',
                width: screenHeight * 0.35,
              ),

              const SizedBox(
                  height: 20.0), // Add spacing between image and text
              const Text(
                'Welcome to the',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 59, 91),
                ),
              ),
              const SizedBox(
                  height: 10.0), // Add spacing between image and text
              const Text(
                textAlign: TextAlign.center,
                'Ventilation Calculator',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 255, 109, 29),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 50.0), // Add spacing between text and button
              Container(
                width: 0.85 * screenWidth, // Set your desired width
                child: const Text(
                  textAlign: TextAlign.center,
                  'This calculator helps you figure out how well your space is ventilated. Good ventilation is important to avoid diseases.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 16, 24, 40),
                  ),
                ),
              ),

              const SizedBox(
                  height: 20.0), // Add spacing between text and button

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Instructions()),
                  );
                  // Navigate to the next page (to be implemented later)
                  // You can use Navigator.push or a similar method here
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 45, 133, 185),
                    minimumSize: const Size(350, 55.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: const Text(
                  'Let\'s get started',
                  style: TextStyle(
                    color: Color.fromARGB(255, 242, 244, 247),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
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
        ),
      ),
    );
  }
}

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    debugPrint('Screen Height: $screenHeight');
    debugPrint('Screen Width: $screenWidth');

    return MaterialApp(
      title: 'Instructions',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 7, 59, 91), // Set white background
        body: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            children: [
              const SizedBox(
                  height: 10.0), // Add spacing between text and button
              Container(
                width: 0.85 * screenWidth, // Set your desired width
                child: const Text(
                  textAlign: TextAlign.left,
                  'This tool estimates:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 255, 109, 29),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                  height: 20.0), // Add spacing between text and button
              Container(
                width: 0.85 * screenWidth,
                child: const Text(
                  textAlign: TextAlign.left,
                  '1. The ventilation rate of your space.',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 242, 244, 247),
                    fontWeight: FontWeight.bold,
                  ),
                ), // Add spacing between text and button
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 0.85 * screenWidth,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '2. The maximum occupancy ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 242, 244, 247),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            'based on WHO recommended requirements. Please note that reccomended occupancy only considers ventilation rate; physical distancing should always be ensured.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 242, 244, 247),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height: 10.0), // Add spacing between image and text
              Container(
                width: 0.85 * screenWidth,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '3. The potential ventilation gap, ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 242, 244, 247),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'considering: ',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 242, 244, 247),
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n \u2022 Desired room occupancy. \n \u2022 Actual estimated ventilation rate.',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 242, 244, 247),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height: 30.0), // Add spacing between image and text
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page (to be implemented later)
                  // You can use Navigator.push or a similar method here
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 109, 29),
                    minimumSize: const Size(350, 55.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: const Text(
                  'Got it!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 242, 244, 247),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
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
                        color: Color.fromARGB(255, 242, 244, 247),
                      ),
                    ),
                    TextSpan(
                      text: 'World Health Organization (WHO)',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 242, 244, 247),
                        fontWeight: FontWeight.bold, // Make this part bold
                      ),
                    ),
                    TextSpan(
                      text: ' to calculate ventilation rates.',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 242, 244, 247),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
