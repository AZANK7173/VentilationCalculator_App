import 'package:flutter/material.dart';
import 'package:ventilation_app/screens/2-instructions.dart';
import 'package:ventilation_app/screens/1-splash_screen.dart';
import 'package:ventilation_app/screens/3-input_1.dart';
import 'package:ventilation_app/screens/4n-input_nat_2.dart';
import 'package:ventilation_app/screens/4n-input_nat_3.dart';
import 'package:ventilation_app/screens/5n-nat_wind_speed.dart';
import 'package:ventilation_app/screens/6n-nat_results_single.dart';
import 'package:ventilation_app/screens/7n-nat_results_cross.dart';
import 'package:ventilation_app/screens/4m-input_mec_2.dart';
import 'package:ventilation_app/screens/5m-mec_results.dart';
import 'package:ventilation_app/screens/4n2-input_nat_more_opens.dart';
import 'package:ventilation_app/screens/5n2-nat_temp.dart';
import 'package:ventilation_app/screens/weather-screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        // return MaterialPageRoute(builder: (_) => WeatherScreen());
      case '/second':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => const Instructions());
      case '/input_1':
        return MaterialPageRoute(builder: (_) => Input1());
      case '/input_nat_2':
        return MaterialPageRoute(builder: (_) => InputNat2());
      case '/input_nat_3':
        return MaterialPageRoute(builder: (_) => InputNat3());
      case '/nat_wind_speed':
        return MaterialPageRoute(builder: (_) => NatWindSpeed());
      case '/nat_temperature':
        return MaterialPageRoute(builder: (_) => NatTemperature());
      case '/nat_results_single':
        return MaterialPageRoute(builder: (_) => NatResultsSingle());
      case '/nat_results_cross':
        return MaterialPageRoute(builder: (_) => NatResultsCross());
      case '/input_mech_2':
        return MaterialPageRoute(builder: (_) => InputMec2());
      case '/mec_results':
        return MaterialPageRoute(builder: (_) => MecResults());
      case '/input_nat_more_opens':
        return MaterialPageRoute(builder: (_) => InputNatMoreOpens());
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
