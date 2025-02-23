import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/slider_and_switch.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class InputNat2 extends StatelessWidget {
  // final String data;
  // const InputNat2({Key key, this.data}) : super(key: key);

  final GlobalKey<CustomInputWidgetState> _openingNumKey =
      GlobalKey<CustomInputWidgetState>();

  final GlobalKey<Slider0To100State> _openingPercentage =
      GlobalKey<Slider0To100State>();

  final GlobalKey<DimensionInputRowState> _windowHeightKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _windowWidthKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<SwitcherState> _mosquitoNetKey = GlobalKey<SwitcherState>();

  final GlobalKey<CustomInputWidgetState> _openingNumKey2 =
      GlobalKey<CustomInputWidgetState>();

  final GlobalKey<Slider0To100State> _openingPercentage2 =
      GlobalKey<Slider0To100State>();

  final GlobalKey<DimensionInputRowState> _windowHeightKey2 =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _windowWidthKey2 =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<SwitcherState> _mosquitoNetKey2 = GlobalKey<SwitcherState>();

  final GlobalKey<SwitcherState> _crossKey = GlobalKey<SwitcherState>();

  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final natValue = ModalRoute.of(context)?.settings.arguments as bool;
    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_1');
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
                  _buildInstructionsContent(context, calculationState),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildWindowInputWidget1Facade(context, calculationState),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  _buildWindowInputWidget2Facade(context, calculationState),
                  const SizedBox(height: 20.0),
                  NextButton(
                    onPressed: () {
                      // Validate data for the first opening
                      final openingNum =
                          _openingNumKey.currentState?.currentText ?? '0';
                      final openingPercentage =
                          _openingPercentage.currentState?.sliderValue ?? 0;
                      final dataWindowWidth =
                          _windowWidthKey.currentState?.dimensionData;
                      final dataWindowHeight =
                          _windowHeightKey.currentState?.dimensionData;
                      final mosquitoNet =
                          _mosquitoNetKey.currentState?.isOn ?? false;

                      bool canProceed1 = false;
                      bool canProceed2 = false;

                      // Check if the data for the first opening is valid
                      if (dataWindowHeight != null && dataWindowWidth != null) {
                        final height = dataWindowHeight['number'] ?? '0';
                        final width = dataWindowWidth['number'] ?? '0';

                        // Validate that height and width are numbers no 0 allowed
                        if (isValidDouble(height, false) &&
                            isValidDouble(width, false) &&
                            isValidInt(openingNum, false) &&
                            openingPercentage != 0) {
                          calculationState.updateOpeningNum(openingNum);
                          calculationState
                              .updateOpeningPercentage(openingPercentage);
                          calculationState.updateMosquitoNet(mosquitoNet);

                          calculationState.updateWindowDimensions(
                            height,
                            width,
                            createUnitMap(dataWindowHeight['unit']),
                            createUnitMap(dataWindowWidth['unit']),
                          );

                          canProceed1 = true;
                        } else {
                          print(
                              'Invalid window dimensions. Ensure they are numeric.');
                        }
                      } else {
                        print(
                            'One or more dimensions are missing for the first opening.');
                      }

                      // Validate data for the second opening
                      final openingNum2 =
                          _openingNumKey2.currentState?.currentText ?? '0';
                      final openingPercentage2 =
                          _openingPercentage2.currentState?.sliderValue ?? 0;
                      final dataWindowWidth2 =
                          _windowWidthKey2.currentState?.dimensionData;
                      final dataWindowHeight2 =
                          _windowHeightKey2.currentState?.dimensionData;
                      final mosquitoNet2 =
                          _mosquitoNetKey2.currentState?.isOn ?? false;

                      // Check if the data for the second opening is valid
                      if (dataWindowHeight2 != null &&
                          dataWindowWidth2 != null) {
                        final height2 = dataWindowHeight2['number'] ?? '0';
                        final width2 = dataWindowWidth2['number'] ?? '0';

                        // Validate that height and width are numbers
                        if (isValidDouble(height2, true) &&
                            isValidDouble(width2, true) &&
                            isValidInt(openingNum2, true)) {
                          calculationState.updateOpeningNum2(openingNum2);
                          calculationState
                              .updateOpeningPercentage2(openingPercentage2);
                          calculationState.updateMosquitoNet2(mosquitoNet2);

                          calculationState.updateWindowDimensions2(
                            height2,
                            width2,
                            createUnitMap(dataWindowHeight2['unit']),
                            createUnitMap(dataWindowWidth2['unit']),
                          );

                          canProceed2 = true;
                        } else {
                          print(
                              'Invalid window dimensions for the second opening. Ensure they are numeric.');
                        }
                      } else {
                        print(
                            'One or more dimensions are missing for the second opening.');
                      }

                      // Validate crossKey value
                      final crossKey = _crossKey.currentState?.isOn ?? false;
                      calculationState.updateSideOfTheRoom(crossKey);

                      if (canProceed1 && canProceed2) {
                        if (crossKey) {
                          Navigator.of(context).pushNamed('/input_nat_3');
                        } else {
                          Navigator.of(context).pushNamed('/nat_temperature');
                        }
                      } else {
                        print("Cannot proceed, invalid data.");
                      }
                    },
                    text: 'Next',
                    displayMessage:
                        "Invalid dimension values, please \n correct them before proceeding",
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

  Widget _buildInstructionsContent(
      BuildContext context, CalculationState calculationState) {
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
            text: 'Opening Characteristics',
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'We are now referring to the ',
            'facade toward the exterior. ',
            'Note that several typologies of opening could be available on the same wall (i.e. two different types of window or one window and one door).',
          ),
          const SizedBox(height: 20.0),
          Switcher(
            key: _crossKey,
            initialValue: calculationState.sideofroom,
            switchText:
                'Are there openings available in \n other side of the room?',
          ),
          const SizedBox(height: 20.0),
          OpeningImage(
              screenWidth: screenWidth,
              filepath: 'assets/opening_natural_1.jpg'),
          const SizedBox(height: 20.0),
          _buildHyperLinkText('What does “typologies of opening “ mean? ',
              'Learn more', context),
          const SizedBox(height: 20.0),
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

  Widget _buildWindowInputWidget1Facade(
      BuildContext context, CalculationState calculationState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextEntry(
          myColor: Color.fromARGB(255, 67, 150, 199),
          text: 'Door/window number 1',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10.0),
        CustomInputWidget(
            key: _openingNumKey,
            initialValue: calculationState.openingsnum,
            inputText: 'Number of openings with the same size: '),
        const SizedBox(height: 20.0),
        Slider0To100(
            key: _openingPercentage,
            initialValue: calculationState.openpercentage,
            dragText: 'How much do you usually open it?'),
        const SizedBox(height: 20.0),
        const TextEntry(
            myColor: Color.fromARGB(255, 102, 112, 133),
            text: 'Enter dimensions',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        const SizedBox(height: 20.0),
        DimensionInputRow(
          key: _windowWidthKey,
          initialNumber: calculationState.windowwidth,
          initialDropdownValue:
              getSelectedSetting(calculationState.unitWindowWidth),
          labelText: 'Width',
          dropdownItems: ['meters', 'inches'],
        ),
        const SizedBox(height: 10.0),
        DimensionInputRow(
            key: _windowHeightKey,
            initialNumber: calculationState.windowheight,
            initialDropdownValue:
                getSelectedSetting(calculationState.unitWindowHeight),
            dropdownItems: ['meters', 'inches'],
            labelText: 'Height'),
        const SizedBox(height: 10.0),
        Switcher(
          key: _mosquitoNetKey,
          initialValue: calculationState.mosquitonets,
          switchText: 'Does it have a mosquito net?',
        ),
      ],
    );
  }

  Widget _buildWindowInputWidget2Facade(
      BuildContext context, CalculationState calculationState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextEntry(
          myColor: Color.fromARGB(255, 67, 150, 199),
          text: 'Door/window number 2 (i.e a door)',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10.0),
        CustomInputWidget(
            key: _openingNumKey2,
            initialValue: calculationState.openingsnum2,
            inputText: 'Number of openings with the same size: '),
        const SizedBox(height: 20.0),
        Slider0To100(
            key: _openingPercentage2,
            initialValue: calculationState.openpercentage2,
            dragText: 'How much do you usually open it?'),
        const SizedBox(height: 20.0),
        const TextEntry(
            myColor: Color.fromARGB(255, 102, 112, 133),
            text: 'Enter dimensions',
            fontSize: 15,
            fontWeight: FontWeight.normal),
        const SizedBox(height: 20.0),
        DimensionInputRow(
          key: _windowWidthKey2,
          initialNumber: calculationState.windowwidth2,
          initialDropdownValue:
              getSelectedSetting(calculationState.unitWindowWidth2),
          labelText: 'Width',
          dropdownItems: ['meters', 'inches'],
        ),
        const SizedBox(height: 10.0),
        DimensionInputRow(
            key: _windowHeightKey2,
            initialNumber: calculationState.windowheight2,
            initialDropdownValue:
                getSelectedSetting(calculationState.unitWindowHeight2),
            dropdownItems: ['meters', 'inches'],
            labelText: 'Height'),
        const SizedBox(height: 10.0),
        Switcher(
          key: _mosquitoNetKey2,
          initialValue: calculationState.mosquitonets2,
          switchText: 'Does it have a mosquito net?',
        ),
      ],
    );
  }
}
