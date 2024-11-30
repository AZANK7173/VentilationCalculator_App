import 'dart:math';

// Convert meters to inches.
double convertMetersToInches(double meters) {
  return meters * 39.3701;
}

// Convert inches to meters.
double convertInchesToMeters(double inches) {
  return inches * 0.0254;
}

// Convert meters per second to kilometers per hour.
double convertMetersPerSecondToKilometersPerHour(double metersPerSecond) {
  return metersPerSecond * 3.6;
}

// Convert kilometers per hour to meters per second.
double convertKilometersPerHourToMetersPerSecond(double kilometersPerHour) {
  return kilometersPerHour / 3.6;
}

// Convert m^3/s to l/s.
double convertCubicMetersPerSecondToLitersPerSecond(
    double cubicMetersPerSecond) {
  return cubicMetersPerSecond * 1000;
}

// Convert m^3/h to m^3/s.
double convertCubicMetersPerHourToCubicMetersPerSecond(
    double cubicMetersPerHour) {
  return cubicMetersPerHour / 3600;
}

// Convert m^3/h to l/s.
double convertCubicMetersPerHourToLitersPerSecond(double cubicMetersPerHour) {
  return cubicMetersPerHour / 3.6;
}

// convert cfm to l/s
double convertCubicFeetPerMinuteToLitersPerSecond(double cubicFeetPerMinute) {
  return cubicFeetPerMinute * 0.471947;
}

// convert ACH to l/s, volume should be in m^3
double convertAirChangesPerHourToLitersPerSecond(
    double airChangesPerHour, double volume) {
  return (airChangesPerHour * volume) / 3.6;
}

/// ROOM VALUES
// Calculate the surface of a wall.
double computeSurface(String? width, String? height) {
  double widthValue = double.tryParse(width ?? '') ?? 0;
  double heightValue = double.tryParse(height ?? '') ?? 0;
  return widthValue * heightValue;
}

// Calculate volume in the room.
double computeVolume(String? width, String? height, String? length) {
  double widthValue = double.tryParse(width ?? '') ?? 0;
  double heightValue = double.tryParse(height ?? '') ?? 0;
  double lengthValue = double.tryParse(length ?? '') ?? 0;
  return widthValue * heightValue * lengthValue;
}

// NOTE, AT THE BEGINNING: CONVERT ALL VALUES FROM ROOM TO METRIC SYSTEM
// THAT INCLUDES WINDSPEED, TEMPERATURE, HEIGHT, ETC.


/// NATURAL VENTILATION

/// 1 - ONE SIDED
// Estimated Ventilation for one sided (surface in m^2, windspeed in m/s, temperature in K, height in m, result in l/s)
double computeEstimatedVentilationSingleNat(
    double surface,
    double openingSurface,
    String? temperatureIn,
    String? height,
    String? temperatureOut) {
  double temperatureInValue = double.tryParse(temperatureIn ?? '') ?? 0;
  double heightValue = double.tryParse(height ?? '') ?? 0;
  double temperatureOutValue = double.tryParse(temperatureOut ?? '') ?? 0;

  double deltaT = (temperatureInValue - temperatureOutValue).abs();

  return 0.25 *
      surface *
      sqrt(9.81 * (heightValue * deltaT) / temperatureInValue) *
      1000;
}

/// 2 - TWO SIDED (CROSS VENTILATION)
// Estimated Ventilation (surface in m^2, windspeed in m/s, result in l/s)
double computeEstimatedVentilationCrossNat(double surface, String? windspeed) {
  double windspeedValue = double.tryParse(windspeed ?? '') ?? 0;
  return 0.65 * surface * windspeedValue * 1000;
}

/// MECHANICAL VENTILATION
// Estimated Ventilation (vent rate in l/s, result in l/s)
// Calculate the sum of all the mecanical ventilation rates
double computeTotalVentilationMec(
    Map<String, bool> flowUnits, Map<String, double> values, double volume) {
  double totalVentilation = 0;

  values.forEach((key, value) {
    if (flowUnits[key] == true) {
      switch (key) {
        case 'l/s':
          totalVentilation += value;
          break;
        case 'm³/s':
          totalVentilation +=
              convertCubicMetersPerSecondToLitersPerSecond(value);
          break;
        case 'm³/h':
          totalVentilation += convertCubicMetersPerHourToLitersPerSecond(value);
          break;
        case 'cfm':
          totalVentilation += convertCubicFeetPerMinuteToLitersPerSecond(value);
          break;
        case 'ACH':
          totalVentilation +=
              convertAirChangesPerHourToLitersPerSecond(value, volume);
          break;
        default:
          break;
      }
    }
  });
  return totalVentilation;
}

/// GENERAL OUTPUT FORMULAS
// compute estimated occupancy
int computeEstimatedOccupancy(
    double estimatedVentilation, double whoRecommendation) {
  return estimatedVentilation ~/ whoRecommendation;
}

// compute the ventilation improvement
double computeVentilationImprovement(
    double estimatedVentilation, double whoRecommendation, int people) {
  return (people * whoRecommendation) - estimatedVentilation;
}
