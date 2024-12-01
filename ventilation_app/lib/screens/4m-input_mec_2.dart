import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/elements/upper_navigation_bar.dart';
import 'package:ventilation_app/elements/texts_and_buttons.dart';
import 'package:ventilation_app/state_manager.dart';

class InputMec2 extends StatelessWidget {
  final GlobalKey<DimensionInputRowState> _dimensionVentRate =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _dimensionVentRate2 =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _dimensionVentRate3 =
      GlobalKey<DimensionInputRowState>();

  final GlobalKey<DimensionInputRowState> _dimensionVentRate4 =
      GlobalKey<DimensionInputRowState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final calculationState = Provider.of<CalculationState>(context);

    return MaterialApp(
      title: 'Input Mechanical 2',
      home: Scaffold(
        appBar: MyAppBar(
          onPressed1: () {
            Navigator.of(context).pushNamed('/input_1');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('/');
          },
          title: "Mechanical Ventilation",
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
                  DimensionInputRow(
                      key: _dimensionVentRate,
                      labelText: 'ventilator 1',
                      dropdownItems: ['l/s', 'm³/s', 'm³/h', 'ACH', 'CFM']),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _dimensionVentRate2,
                      labelText: 'ventilator 2',
                      dropdownItems: ['l/s', 'm³/s', 'm³/h', 'ACH', 'CFM']),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _dimensionVentRate3,
                      labelText: 'ventilator 3',
                      dropdownItems: ['l/s', 'm³/s', 'm³/h', 'ACH', 'CFM']),
                  const SizedBox(height: 20.0),
                  DimensionInputRow(
                      key: _dimensionVentRate4,
                      labelText: 'ventilator 4',
                      dropdownItems: ['l/s', 'm³/s', 'm³/h', 'ACH', 'CFM']),
                  const SizedBox(height: 20.0),
                  _buildManualCalcButton(context),
                  const SizedBox(height: 20.0),
                  DividerWidget(screenWidth),
                  const SizedBox(height: 20.0),
                  const TextEntry(
                      myColor: Color.fromARGB(255, 7, 59, 91),
                      text: 'Select your setting of interest',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 30.0),
                  NextButton(
                    onPressed: () {
                      final dataVentRate =
                          _dimensionVentRate.currentState?.dimensionData;
                      final dataVentRate2 =
                          _dimensionVentRate2.currentState?.dimensionData;
                      final dataVentRate3 =
                          _dimensionVentRate3.currentState?.dimensionData;
                      final dataVentRate4 =
                          _dimensionVentRate4.currentState?.dimensionData;

                      if (dataVentRate != null) {
                        calculationState.updateVentRate(
                            dataVentRate['number'] ?? '0',
                            createVentRateUnitMap(dataVentRate['unit']));
                      }

                      if (dataVentRate2 != null) {
                        calculationState.updateVentRate2(
                            dataVentRate2['number'] ?? '0',
                            createVentRateUnitMap(dataVentRate2['unit']));
                      }

                      if (dataVentRate3 != null) {
                        calculationState.updateVentRate3(
                            dataVentRate3['number'] ?? '0',
                            createVentRateUnitMap(dataVentRate3['unit']));
                      }

                      if (dataVentRate4 != null) {
                        calculationState.updateVentRate4(
                            dataVentRate4['number'] ?? '0',
                            createVentRateUnitMap(dataVentRate4['unit']));
                      }

                      Navigator.of(context).pushNamed('/mec_results');
                    },
                    text: 'See Results',
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
            text: 'Mechanical ventilation system characteristics',
          ),
          const SizedBox(height: 20.0),
          _buildRichTextContent(
            'Now, we will need you to ',
            'find the ventilation rate ',
            'on your system. ',
          ),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '•  Check your system\'s manual for the airflow rates.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '•  If you don\'t have the ACH value, follow these steps:',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '     •  Look at the technical drawing of the system.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  '     •  Enter the largest value between inlet and outlet vents.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text:
                  '     •  For multiple inlets/outlets, add their values together.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 5.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: '     •  Use the drop-down menu to select the unit.',
              fontSize: 15,
              fontWeight: FontWeight.normal),
          const SizedBox(height: 20.0),
          OpeningImage(
              screenWidth: screenWidth,
              filepath: 'assets/mecanical_manual.jpg'),
          const SizedBox(height: 20.0),
          _buildExampleString(
              'Example: ', 'Total ventilation rate = A + B + C + D + E + F'),
          const SizedBox(height: 20.0),
          DividerWidget(screenWidth),
          const SizedBox(height: 20.0),
          const TextEntry(
              myColor: Color.fromARGB(255, 102, 112, 133),
              text: 'Ventilation rate',
              fontSize: 17,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildExampleString(String boldText1, String normalText1) {
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
            text: normalText1,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color.fromARGB(255, 102, 112, 133),
              fontWeight: FontWeight.normal,
            ),
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

  Widget _buildManualCalcButton(BuildContext context) {
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
          'Calculate manually',
          style: TextStyle(
            color: Color.fromARGB(255, 45, 133, 185),
          ),
        ),
      ),
    );
  }
}
