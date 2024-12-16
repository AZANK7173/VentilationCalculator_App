import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ventilation_app/geolocation.dart';
import 'package:ventilation_app/weather.dart';

class WeatherScreen extends StatelessWidget {
  final LocationService locationService = LocationService();
  final WeatherService weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Information')),
      body: FutureBuilder<Position>(
        future: locationService.getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final position = snapshot.data!;
            return FutureBuilder<Map<String, dynamic>>(
              future: weatherService.getWeatherData(position),
              builder: (context, weatherSnapshot) {
                if (weatherSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (weatherSnapshot.hasError) {
                  return Center(child: Text('Error: ${weatherSnapshot.error}'));
                } else if (weatherSnapshot.hasData) {
                  final weatherData = weatherSnapshot.data!;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Temperature: ${weatherData['main']['temp']}°C'),
                        Text('Wind Speed: ${weatherData['wind']['speed']} m/s'),
                      ],
                    ),
                  );
                }
                return Center(child: Text('No Data'));
              },
            );
          }
          return Center(child: Text('Unable to get location.'));
        },
      ),
    );
  }
}
