import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ventilation_app/api_key.dart';

class WeatherService {

  Future<Map<String, dynamic>> getWeatherData(Position position) async {
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather'
        '?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
