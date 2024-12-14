import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class InputNat3 extends StatelessWidget {
  // final String data;

  final GlobalKey<CustomInputWidgetState> _openingNumKey3 =
      GlobalKey<CustomInputWidgetState>();

  final GlobalKey<Slider0To100State> _openingPercentage3 =
      GlobalKey<Slider0To100State>();

  final GlobalKey<DimensionInputRowState> _windowHeightKey3 =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _windowWidthKey3 =
      GlobalKey<DimensionInputRowState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final calculationState = Provider.of<CalculationState>(context);

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
          title: "Natural Ventilation",
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
                  _buildWindowInputWidget3Facade(calculationState),
                  const SizedBox(height: 20.0),
                  NextButton(
                    onPressed: () {
                      // COMPUTE THE SINGLE SIDE
                      final openingNum3 =
                          _openingNumKey3.currentState?.currentText ?? '0';

                      calculationState.updateOpeningNum3(openingNum3);

                      final openingPercentage3 =
                          _openingPercentage3.currentState?.sliderValue ?? 0;

                      calculationState
                          .updateOpeningPercentage3(openingPercentage3);

                      final dataWindowWidth3 =
                          _windowWidthKey3.currentState?.dimensionData;

                      final dataWindowHeight3 =
                          _windowHeightKey3.currentState?.dimensionData;

                      if (dataWindowHeight3 != null &&
                          dataWindowWidth3 != null) {
                        calculationState.updateWindowDimensions3(
                          dataWindowHeight3['number'] ?? '0',
                          dataWindowWidth3['number'] ?? '0',
                          createUnitMap(dataWindowHeight3['unit']),
                          createUnitMap(dataWindowWidth3['unit']),
                        );
                      } else {
                        print('One or more dimensions are missing.');
                      }

                      Navigator.of(context).pushNamed('/nat_wind_speed');
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
            text: 'Opening Characteristics - Other Side',
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'Now for the openings in the ',
            'other side of the room. ',
            'Usually, these are doors that lead to the inside of the room.',
          ),
          const SizedBox(height: 20.0),
          OpeningImage(
              screenWidth: screenWidth, filepath: 'assets/other_wall.jpg'),
          const SizedBox(height: 20.0),
          _buildHyperLinkText('What does “typologies of opening “ mean? ',
              'Learn more', context),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildHyperLinkText(
      String boldText1, String boldText2, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/input_nat_more_opens');
      },
      child: RichText(
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
            ),
          ],
        ),
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

  Widget _buildWindowInputWidget3Facade(CalculationState calculationState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextEntry(
          myColor: Color.fromARGB(255, 67, 150, 199),
          text: 'Door/window characteristics',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10.0),
        CustomInputWidget(
            key: _openingNumKey3,
            initialValue: calculationState.openingsnum3,
            inputText: 'Number of openings with the same size: '),
        const SizedBox(height: 20.0),
        Slider0To100(
            key: _openingPercentage3,
            initialValue: calculationState.openpercentage3,
            dragText: 'How much do you usually open it?'),
        const SizedBox(height: 20.0),
        const TextEntry(
            myColor: Color.fromARGB(255, 102, 112, 133),
            text: 'Enter dimensions',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        const SizedBox(height: 20.0),
        DimensionInputRow(
          key: _windowWidthKey3,
          initialNumber: calculationState.windowwidth3,
          initialDropdownValue:
              getSelectedSetting(calculationState.unitWindowWidth3),
          labelText: 'Width',
          dropdownItems: ['meters', 'inches'],
        ),
        const SizedBox(height: 10.0),
        DimensionInputRow(
            key: _windowHeightKey3,
            initialNumber: calculationState.windowheight3,
            initialDropdownValue:
                getSelectedSetting(calculationState.unitWindowHeight3),
            dropdownItems: ['meters', 'inches'],
            labelText: 'Height'),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
