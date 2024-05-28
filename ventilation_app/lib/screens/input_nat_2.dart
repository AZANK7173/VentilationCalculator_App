import 'package:flutter/material.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart';

class InputNat2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        appBar: MyAppBar(),
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
                  _buildWindowInputWidget(),
                  const SizedBox(height: 20.0),
                  _buildAddNewWindowButton(context),
                  const SizedBox(height: 20.0),
                  _buildNextButton(context),
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
          _buildTitleText('Opening Characteristics'),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'We are now referring to the ',
            'facade toward the exterior. ',
            'Note that several typologies of opening could be available on the same wall (i.e. two different types of window or one window and one door).',
          ),
          const SizedBox(height: 20.0),
          _buildOpeningImage(screenWidth),
          const SizedBox(height: 20.0),
          _buildHyperLinkText(
              'What does “typologies of opening “ mean? ', 'Learn more'),
          const SizedBox(height: 20.0),
          _buildDivider(screenWidth),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20.0,
        color: Color.fromARGB(255, 255, 109, 29),
        fontWeight: FontWeight.bold,
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
                launch('https://www.google.com');
              },
          ),
        ],
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17.0,
        color: Color.fromARGB(255, 67, 150, 199),
        fontWeight: FontWeight.bold,
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

  Widget _buildDivider(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.92,
      child: const Divider(
        color: Color.fromARGB(255, 223, 241, 255),
        thickness: 1,
      ),
    );
  }

  Widget _buildWindowInputWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentText(
            'Door/window number 1'), //unica coisa que vai mudar na hora de fazer a logica de adicionar mais janelas
        const SizedBox(height: 10.0),
        _buildInput1('Number of openings with the same size: '),
        const SizedBox(height: 20.0),
        Slider0To100(dragText: 'How much do you usually open it?'),
        const SizedBox(height: 20.0),
        _buildEnterDimensionsLabel(),
        const SizedBox(height: 20.0),
        _buildDimensionInputRow('Length', ['meters', 'inches', 'centimeters']),
        const SizedBox(height: 10.0),
        _buildDimensionInputRow('Height', ['meters', 'inches', 'centimeters']),
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
        Text(
          inputText,
          style: const TextStyle(
            fontSize: 15.0,
            color: Color.fromARGB(255, 102, 112, 133),
            fontWeight: FontWeight.bold,
          ),
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

Widget _buildDimensionInputRow(String labelText, List<String> dropdownItems) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(width: 20.0),
      SizedBox(
        width: 150.0,
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
      const SizedBox(width: 20.0),
      DropdownMenuExample(
        dropdownWidth: 0.4,
        items: dropdownItems,
      ),
    ],
  );
}

Widget _buildOpeningImage(double screenWidth) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Image.asset(
      'assets/opening_natural_1.jpg',
      width: screenWidth * 0.90,
    ),
  );
}

Widget _buildEnterDimensionsLabel() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        'Enter dimensions',
        style: TextStyle(
          fontSize: 15.0,
          color: Color.fromARGB(255, 102, 112, 133),
        ),
      ),
    ],
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

Widget _buildNextButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/nat_wind_speed');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 133, 185),
        minimumSize: const Size(350, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          color: Color.fromARGB(255, 242, 244, 247),
        ),
      ),
    ),
  );
}
