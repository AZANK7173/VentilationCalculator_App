import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/elements/carossel.dart';

class InputNatMoreOpens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_nat_2');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Opening Typologies",
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInstructionsContent(context),
                  const SizedBox(height: 20.0),
                  NextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/input_nat_2');
                    },
                    text: 'Next',
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionsContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextEntry(
            myColor: Color.fromARGB(255, 255, 109, 29),
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            text: 'Overview',
          ),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  'In a room, several openings (like windows and doors) may be available. Each opening can have different characteristics:',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            '',
            '1. Geometry/Dimensions: ',
            'The size and shape of the opening.',
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            '',
            '2. Opening Mode: ',
            'How the opening operates, such as sliding, pivot, or hung windows.',
          ),
          const SizedBox(height: 20.0),
          const CarouselImageSlider(
            imageAssetPaths: [
              'assets/typology/horizontal_vertical.jpg',
              'assets/typology/slide.jpg',
              'assets/typology/tilt_and_turn.jpg',
              'assets/typology/top_bottom.jpg'
            ],
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            '',
            '3. Mosquito Net: ',
            'Whether the opening has a mosquito net or not.',
          ),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 67, 150, 199),
              text: 'Important Points:',
              fontSize: 20,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            '',
            '• Operable Openings: ',
            'Only consider windows and doors that can be opened to increase ventilation. Fixed windows that provide light but cannot be opened should not be included.',
          ),
          const SizedBox(height: 10.0),
          _buildRichTextContent(
            '',
            '• Location: ',
            'This tool only considers openings located in walls, not the roof.',
          ),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
          const SizedBox(height: 20.0),
          _buildOpeningImage(screenWidth, 'assets/typology_types.jpg'),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 67, 150, 199),
              text: 'What to Include:',
              fontSize: 20,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '• Windows and doors that can be opened.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 10.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  '• Openings with different characteristics or multiple openings of the same type',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
        ],
      ),
    );
  }

  Widget _buildHyperLinkText(String boldText1, String boldText2) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: boldText2,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 255, 109, 29),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(
                    Uri.parse('https://www.youtube.com/watch?v=KWP8pQnGoBw'));
              },
          ),
        ],
      ),
    );
  }

  Widget _buildRichTextContent(
      String normalText1, String boldText, String normalText2) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
            ),
          ),
          TextSpan(
            text: boldText,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: normalText2,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWindowInputWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextEntry(
          myColor: Color.fromARGB(255, 67, 150, 199),
          text: 'Door/window number 1',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
        //unica coisa que vai mudar na hora de fazer a logica de adicionar mais janelas
        const SizedBox(height: 10.0),
        _buildInput1('Number of openings with the same size: '),
        const SizedBox(height: 20.0),
        Slider0To100(dragText: 'How much do you usually open it?'),
        const SizedBox(height: 20.0),
        const TextEntry(
            myColor: Color.fromARGB(255, 102, 112, 133),
            text: 'Enter dimensions',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        const SizedBox(height: 20.0),
        const DimensionInputRow(
            dropdownItems: ['meters', 'inches', 'centimeters'],
            labelText: 'Length'),
        const SizedBox(height: 10.0),
        const DimensionInputRow(
            dropdownItems: ['meters', 'inches', 'centimeters'],
            labelText: 'Height'),
        const SizedBox(height: 10.0),
        Switcher(
          switchText: 'Does it have a mosquito net?',
        ),
      ],
    );
  }

  Widget _buildInput1(String inputText) {
    return Row(
      children: [
        TextEntry(
          myColor: const Color.fromARGB(255, 102, 112, 133),
          text: inputText,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 10.0),
        const Expanded(
          child: SizedBox(
            height: 30,
            child: TextField(
              style:
                  TextStyle(fontSize: 12.0, height: 2.0, color: Colors.black),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 214, 220, 220)),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 37),
                isDense: true,
                labelText: '',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildOpeningImage(double screenWidth, String filepath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Image.asset(
      filepath,
      width: screenWidth * 0.90,
    ),
  );
}

Widget _buildAddNewWindowButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        //TODO add new window
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        minimumSize: const Size(350, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 45, 133, 185),
          ),
        ),
      ),
      child: const Text(
        '+ Add new openning type',
        style: TextStyle(
          color: Color.fromARGB(255, 45, 133, 185),
        ),
      ),
    ),
  );
}
