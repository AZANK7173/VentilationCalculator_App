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

// convert °C to Kelvin
double convertCelsiusToKelvin(double celsius) {
  return celsius + 273.15;
}

// convert °F to Kelvin
double convertFahrenheitToKelvin(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9 + 273.15;
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

/// Opening calculations
double calculateOpeningArea(double width, double height, int numberOfOpenings, double openingPercentage) {
  return width * height * numberOfOpenings * openingPercentage / 100;
}

double convertToMeters(double value, Map<String, bool> unit) {
  if (unit['meters'] == true) {
    return value;
  } else {
    return convertInchesToMeters(value);
  }
}

double convertToMetersPerSecond(double value, Map<String, bool> unit) {
  if (unit['m/s'] == true) {
    return value;
  } else {
    return convertKilometersPerHourToMetersPerSecond(value);
  }
}

double convertTemperature(double value, Map<String, bool> unit) {
  if (unit['°F'] == true) {
    return convertFahrenheitToKelvin(value);
  } else if (unit['°C'] == true) {
    return convertCelsiusToKelvin(value);
  } else {
    return value; // Assuming the value is already in Kelvin
  }
}

/// NATURAL VENTILATION

/// 1 - ONE SIDED
// Estimated Ventilation for one sided (surface in m^2, windspeed in m/s, temperature in K, height in m, result in l/s)
double computeEstimatedVentilationSingleNat(
    double openingSurface,
    double temperatureIn,
    double height,
    double temperatureOut) {

  double deltaT = (temperatureIn - temperatureOut).abs();

  return 0.25 *
      openingSurface *
      sqrt(9.81 * (height * deltaT) / temperatureIn) *
      1000;
}

/// 2 - TWO SIDED (CROSS VENTILATION)
// Estimated Ventilation (surface in m^2, windspeed in m/s, result in l/s)
double computeEstimatedVentilationCrossNat(double surface, double windspeed) {
  return 0.65 * surface * windspeed * 1000;
}

/// MECHANICAL VENTILATION
// Estimated Ventilation (vent rate in l/s, result in l/s)
// Calculate the sum of all the mecanical ventilation rates
double convertFlowRate(double value, Map<String, bool> unit, double volume) {
  if (unit['l/s'] == true) {
    return value;
  } else if (unit['m³/s'] == true) {
    return convertCubicMetersPerSecondToLitersPerSecond(value);
  } else if (unit['m³/h'] == true) {
    return convertCubicMetersPerHourToLitersPerSecond(value);
  } else if (unit['cfm'] == true) {
    return convertCubicFeetPerMinuteToLitersPerSecond(value);
  } else if (unit['ACH'] == true) {
    return convertAirChangesPerHourToLitersPerSecond(value, volume);
  } else {
    return value; // Assuming the value is already in l/s
  }
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