import 'package:flutter_test/flutter_test.dart';
import 'package:ventilation_app/elements/formulas.dart';  // Replace with the actual path to your Dart file


void main() {
  group('Conversion Functions', () {
    test('convertMetersToInches', () {
      expect(convertMetersToInches(1), 39.3701);
      expect(convertMetersToInches(0), 0);
      expect(convertMetersToInches(-1), -39.3701);
    });

    test('convertInchesToMeters', () {
      expect(convertInchesToMeters(39.3701).round(), 1);
      expect(convertInchesToMeters(0), 0);
      expect(convertInchesToMeters(-39.3701).round(), -1);
    });

    test('convertMetersPerSecondToKilometersPerHour', () {
      expect(convertMetersPerSecondToKilometersPerHour(1), 3.6);
      expect(convertMetersPerSecondToKilometersPerHour(0), 0);
      expect(convertMetersPerSecondToKilometersPerHour(-1), -3.6);
    });

    test('convertKilometersPerHourToMetersPerSecond', () {
      expect(convertKilometersPerHourToMetersPerSecond(3.6), 1);
      expect(convertKilometersPerHourToMetersPerSecond(0), 0);
      expect(convertKilometersPerHourToMetersPerSecond(-3.6), -1);
    });

    test('convertCubicMetersPerSecondToLitersPerSecond', () {
      expect(convertCubicMetersPerSecondToLitersPerSecond(1), 1000);
      expect(convertCubicMetersPerSecondToLitersPerSecond(0), 0);
      expect(convertCubicMetersPerSecondToLitersPerSecond(-1), -1000);
    });

    test('convertCubicMetersPerHourToCubicMetersPerSecond', () {
      expect(convertCubicMetersPerHourToCubicMetersPerSecond(3600), 1);
      expect(convertCubicMetersPerHourToCubicMetersPerSecond(0), 0);
      expect(convertCubicMetersPerHourToCubicMetersPerSecond(-3600), -1);
    });

    test('convertCubicMetersPerHourToLitersPerSecond', () {
      expect(convertCubicMetersPerHourToLitersPerSecond(3600), 1000);
      expect(convertCubicMetersPerHourToLitersPerSecond(0), 0);
      expect(convertCubicMetersPerHourToLitersPerSecond(-3600), -1000);
    });

    test('convertCubicFeetPerMinuteToLitersPerSecond', () {
      expect(convertCubicFeetPerMinuteToLitersPerSecond(1), 0.471947);
      expect(convertCubicFeetPerMinuteToLitersPerSecond(0), 0);
      expect(convertCubicFeetPerMinuteToLitersPerSecond(-1), -0.471947);
    });

    test('convertAirChangesPerHourToLitersPerSecond', () {
      expect(convertAirChangesPerHourToLitersPerSecond(1, 100).toStringAsFixed(3), (27.7777).toStringAsFixed(3));
      expect(convertAirChangesPerHourToLitersPerSecond(0, 100), 0);
      expect(convertAirChangesPerHourToLitersPerSecond(-1, 100).toStringAsFixed(3), (-27.7777).toStringAsFixed(3));
    });

    test('convertCelsiusToKelvin', () {
      expect(convertCelsiusToKelvin(0), 273.15);
      expect(convertCelsiusToKelvin(-273.15), 0);
      expect(convertCelsiusToKelvin(100), 373.15);
    });

    test('convertFahrenheitToKelvin', () {
      expect(convertFahrenheitToKelvin(32), 273.15);
      expect(convertFahrenheitToKelvin(-459.67), 0);
      expect(convertFahrenheitToKelvin(212), 373.15);
    });

    test('computeSurface', () {
      expect(computeSurface('5', '3'), 15);
      expect(computeSurface('0', '3'), 0);
      expect(computeSurface('-5', '3'), -15);
    });

    test('computeVolume', () {
      expect(computeVolume('5', '3', '2'), 30);
      expect(computeVolume('0', '3', '2'), 0);
      expect(computeVolume('-5', '3', '2'), -30);
    });

    test('calculateOpeningArea', () {
      expect(calculateOpeningArea(5, 3, 2, 50), 15);
      expect(calculateOpeningArea(0, 3, 2, 50), 0);
      expect(calculateOpeningArea(5, -3, 2, 50), -15);
    });

    test('convertToMeters', () {
      expect(convertToMeters(39.3701, {'meters': false}).round(), 1);
      expect(convertToMeters(0, {'meters': false}).round(), 0);
      expect(convertToMeters(-39.3701, {'meters': false}).round(), -1);
    });

    test('convertToMetersPerSecond', () {
      expect(convertToMetersPerSecond(3.6, {'m/s': false}).round(), 1);
      expect(convertToMetersPerSecond(0, {'m/s': false}).round(), 0);
      expect(convertToMetersPerSecond(-3.6, {'m/s': false}).round(), -1);
    });

    test('convertTemperature', () {
      expect(convertTemperature(0, {'°C': true}), 273.15);
      expect(convertTemperature(32, {'°F': true}), 273.15);
      expect(convertTemperature(273.15, {}), 273.15);
    });

    test('computeEstimatedVentilationSingleNat', () {
      expect(computeEstimatedVentilationSingleNat(10, 300, 3, 250).round(), (5536.8086).round());
      expect(computeEstimatedVentilationSingleNat(0, 300, 3, 250).round(), 0);
      expect(computeEstimatedVentilationSingleNat(10, 0, 3, 250), double.infinity);
    });

    test('computeEstimatedVentilationCrossNat', () {
      expect(computeEstimatedVentilationCrossNat(10, 3), 19500.0);
      expect(computeEstimatedVentilationCrossNat(0, 3), 0);
      expect(computeEstimatedVentilationCrossNat(10, 0), 0);
    });

    test('convertFlowRate', () {
      expect(convertFlowRate(1, {'l/s': true}, 100), 1);
      expect(convertFlowRate(1, {'m³/s': true}, 100), 1000);
      expect(convertFlowRate(3600, {'m³/h': true}, 100), 1000);
      expect(convertFlowRate(1, {'cfm': true}, 100).toStringAsFixed(3), (0.471947).toStringAsFixed(3));
      expect(convertFlowRate(1, {'ACH': true}, 100).toStringAsFixed(3), (27.7777).toStringAsFixed(3));
    });

    test('computeEstimatedOccupancy', () {
      expect(computeEstimatedOccupancy(1000, 10), 100);
      expect(computeEstimatedOccupancy(0, 10), 1);
      expect(computeEstimatedOccupancy(1000, 0), 1);
    });

    test('computeVentilationImprovement', () {
      expect(computeVentilationImprovement(1000, 10, 5), -950);
      expect(computeVentilationImprovement(0, 10, 5), 50);
      expect(computeVentilationImprovement(1000, 10, 0), -1000);
    });

  });
}
