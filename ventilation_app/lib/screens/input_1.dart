import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';

class Input1 extends StatelessWidget {
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
            // Center content vertically
            children: [
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  const SizedBox(width: 20.0),
                  const Text(
                    'Hey, there',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 7, 59, 91),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Image.asset(
                    'assets/waving_hand.png',
                    width: screenHeight * 0.03, // Adjust image width as desired
                    height:
                        screenHeight * 0.03, // Adjust image height as desired
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'Let\’s calculate your room ventilation!',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 7, 59, 91),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 0.92 * screenWidth,
                child: const Divider(color: Color.fromARGB(255, 223, 241, 255)),
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'Select your seting of interest',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 7, 59, 91),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const DropdownMenuExample(
                dropdownWidth: 0.85,
                items: [
                  'Residential Setting',
                  'Hospital Setting',
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'What are the rooms\'s dimensions?',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 7, 59, 91),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Adjust as desired
                child: Image.asset(
                  'assets/room.jpg',
                  width: screenWidth * 0.90,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'Enter dimensions',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 102, 112, 133),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.0),
                  // Text Input
                  SizedBox(
                    width: 150.0, // Adjust width as desired
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Length', // Customize label text
                      ),
                      keyboardType:
                          TextInputType.number, // Set keyboard type for numbers
                    ),
                  ),
                  SizedBox(width: 20.0),

                  // DropdownMenuExample
                  DropdownMenuExample(
                    dropdownWidth: 0.4,
                    items: ['meters', 'inches', 'centimeters'],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.0),
                  // Text Input
                  SizedBox(
                    width: 150.0, // Adjust width as desired
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Height', // Customize label text
                      ),
                      keyboardType:
                          TextInputType.number, // Set keyboard type for numbers
                    ),
                  ),
                  SizedBox(width: 20.0),

                  // DropdownMenuExample
                  DropdownMenuExample(
                    dropdownWidth: 0.4,
                    items: ['meters', 'inches', 'centimeters'],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.0),
                  // Text Input
                  SizedBox(
                    width: 150.0, // Adjust width as desired
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Width', // Customize label text
                      ),
                      keyboardType:
                          TextInputType.number, // Set keyboard type for numbers
                    ),
                  ),
                  SizedBox(width: 20.0),

                  // DropdownMenuExample
                  DropdownMenuExample(
                    dropdownWidth: 0.4,
                    items: ['meters', 'inches', 'centimeters'],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the left
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'How is your room ventilated?',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 7, 59, 91),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align buttons horizontally

                children: [
                  const SizedBox(width: 20.0),
                  // First Button with square shape, grey border, and color change on click
                  TextButton(
                    onPressed: () {
                      // Change button color on click
                      // (consider using a state management solution for complex scenarios)
                      print(
                          'First Button Clicked!'); // Replace with your desired action
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(80, 80),
                      fixedSize: Size(screenWidth * 0.4,
                          screenWidth * 0.4), // Adjust based on screen size
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0)), // Adjust corner radius for smoothness
                      ),
                      backgroundColor: const Color.fromARGB(
                          255, 67, 150, 199), // Base color (adjust as needed)
                      overlayColor: Colors.blueAccent, // Blue on pressed
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Naturally \n',
                            style: TextStyle(
                              color: Colors.white, // Adjust text color
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                          TextSpan(
                            text:
                                'Intentional building openings', // Replace with your desired text
                            style: TextStyle(
                              color: Colors.white, // Adjust text color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),

                  // Second Button with similar behavior (adjust onPressed as needed)
                  TextButton(
                    onPressed: () {
                      // Change button color on click
                      // (consider using a state management solution for complex scenarios)
                      print(
                          'Second Button Clicked!'); // Replace with your desired action
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(80, 80),
                      fixedSize: Size(screenWidth * 0.4,
                          screenWidth * 0.4), // Adjust based on screen size
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      backgroundColor:
                          Colors.white, // Base color (adjust as needed)
                      overlayColor: Colors.blueAccent, // Blue on pressed
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Mechanically \n',
                            style: TextStyle(
                              color: Colors.black, // Adjust text color
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                          TextSpan(
                            text:
                                'Powered fans \n or blowers', // Replace with your desired text
                            style: TextStyle(
                              color: Colors.black, // Adjust text color
                            ),
                          ),
                        ],
                      ),
                    ), // Adjust icon size as desired
                  ),
                ],
              ),
              const SizedBox(
                  height: 20.0), // Add spacing between text and button

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 45, 133, 185),
                    minimumSize: const Size(350, 55.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Color.fromARGB(255, 242, 244, 247),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
