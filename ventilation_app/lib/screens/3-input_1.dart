import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/dropdown_menu_example.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/mec_or_nat.dart';
import 'package:ventilation_app/state_manager.dart';

class Input1 extends StatelessWidget {
  final GlobalKey<MecOrNatToggleButtonsState> _toggleButtonKey =
      GlobalKey<MecOrNatToggleButtonsState>();

  final GlobalKey<DropdownButtonExampleState> _dropdownButtonKey =
      GlobalKey<DropdownButtonExampleState>();

  final GlobalKey<DimensionInputRowState> _dimensionLengthKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _dimensionHeightKey =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _dimensionWidthKey =
      GlobalKey<DimensionInputRowState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Ventilation Calculator',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/second');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  _buildGreetingRow(screenHeight),
                  const SizedBox(height: 10.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'Let’s calculate your room ventilation!',
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    myColor: Color.fromARGB(255, 7, 59, 91),
                    text: 'Select your setting of interest',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  DropdownButtonExample(
                    key: _dropdownButtonKey,
                    initialValue:
                        getSelectedSetting(calculationState.settingOfInterest),
                    items: ['Residential/Comercial', 'Hospital Setting'],
                  ),
                  const SizedBox(height: 30.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'What are the room\'s dimensions?',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 15.0),
                  OpeningImage(
                      screenWidth: screenWidth, filepath: 'assets/room.jpg'),
                  const SizedBox(height: 15.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 102, 112, 133),
                      text: 'Enter dimensions',
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  const SizedBox(height: 15.0),
                  DimensionInputRow(
                      key: _dimensionLengthKey,
                      initialNumber: calculationState.lenght,
                      labelText: 'Length',
                      initialDropdownValue: getSelectedSetting(
                          calculationState.unitLeght), // New attribute
                      dropdownItems: ['meters', 'inches']),
                  const SizedBox(height: 10.0),
                  DimensionInputRow(
                      key: _dimensionHeightKey,
                      initialNumber: calculationState.height,
                      initialDropdownValue:
                          getSelectedSetting(calculationState.unitHeight),
                      labelText: 'Height',
                      dropdownItems: ['meters', 'inches']),
                  const SizedBox(height: 10.0),
                  DimensionInputRow(
                      key: _dimensionWidthKey,
                      initialNumber: calculationState.width,
                      initialDropdownValue:
                          getSelectedSetting(calculationState.unitWidth),
                      labelText: 'Width',
                      dropdownItems: ['meters', 'inches']),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                    text: 'How is your room ventilated?',
                    fontSize: 15.0,
                    myColor: Color.fromARGB(255, 7, 59, 91),
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  MecOrNatToggleButtons(
                    key: _toggleButtonKey,
                    initialNat: calculationState.ventType['nat'] ?? false,
                  ),
                  const SizedBox(height: 20.0),
                  NextButton(
                    text: 'Next',
                    onPressed: () {
                      // length data
                      final dataLength =
                          _dimensionLengthKey.currentState?.dimensionData;
                      final dataHeight =
                          _dimensionHeightKey.currentState?.dimensionData;
                      final dataWidth =
                          _dimensionWidthKey.currentState?.dimensionData;

                      if (dataLength != null &&
                          dataHeight != null &&
                          dataWidth != null) {
                        calculationState.updateRoomDimensions(
                          dataHeight['number'] ?? '0', // Default to '0' if null
                          dataLength['number'] ?? '0',
                          dataWidth['number'] ?? '0',
                          createUnitMap(dataHeight['unit']),
                          createUnitMap(dataLength['unit']),
                          createUnitMap(dataWidth['unit']),
                        );
                      } else {
                        print('One or more dimensions are missing.');
                      }

                      // Access dropdown value using the GlobalKey
                      final dropdownValue =
                          _dropdownButtonKey.currentState?.dropValue;
                      bool res = dropdownValue == 'Residential/Comercial';
                      calculationState.updateSetOfInterest(res);

                      // Access the nat variable using the GlobalKey
                      bool natValue =
                          _toggleButtonKey.currentState?.isNat ?? false;
                      calculationState.updateVentType(natValue);

                      // Navigate to the next screen
                      if (natValue) {
                        Navigator.of(context).pushNamed('/input_nat_2');
                      } else {
                        Navigator.of(context).pushNamed(
                          '/input_mech_2',
                        );
                      }
                    },
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

  Widget _buildGreetingRow(double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TextEntry(
          text: 'Hey, there',
          fontSize: 30.0,
          myColor: Color.fromARGB(255, 7, 59, 91),
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 5.0),
        Image.asset(
          'assets/waving_hand.png',
          width: screenHeight * 0.03,
          height: screenHeight * 0.03,
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
