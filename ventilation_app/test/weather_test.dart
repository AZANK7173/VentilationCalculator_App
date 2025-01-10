import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ventilation_app/weather.dart';

void main() {
  group('WeatherService', () {
    final weatherService = WeatherService();

    test('getWeatherData returns weather data for valid position', () async {
      // Mock position with latitude and longitude
      Position mockPosition = Position(
          latitude: 37.7749,
          longitude: -122.4194,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          altitudeAccuracy: 0, // Required
          headingAccuracy: 0, // Required
          speedAccuracy: 0 // Required
          );

      final weatherData = await weatherService.getWeatherData(mockPosition);

      // Validate the response
      expect(weatherData, isNotNull);
      expect(weatherData['weather'], isNotEmpty);
      expect(weatherData['main']['temp'], isA<num>());
    });

    test('getWeatherData throws an exception for invalid API call', () async {
      Position invalidPosition = Position(
          latitude: -1,
          longitude: double.infinity,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
          speedAccuracy: 0);

      expect(() async => await weatherService.getWeatherData(invalidPosition),
          throwsA(isA<Exception>()));
    });
  });
}
