import 'package:flutter/material.dart';
import 'package:ventilation_app/screens/instructions.dart';
import 'package:ventilation_app/screens/splash_screen.dart';
import 'package:ventilation_app/screens/input_1.dart';
import 'package:ventilation_app/screens/input_nat_2.dart';
import 'package:ventilation_app/screens/nat_wind_speed.dart';
import 'package:ventilation_app/screens/nat_results_single.dart';
import 'package:ventilation_app/screens/nat_results_cross.dart';
import 'package:ventilation_app/screens/input_mec_2.dart';
import 'package:ventilation_app/screens/mec_results.dart';
import 'package:ventilation_app/screens/input_nat_more_opens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/second':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => const Instructions());
      case '/input_1':
        return MaterialPageRoute(builder: (_) => Input1());
      case '/input_nat_2':
        return MaterialPageRoute(builder: (_) => InputNat2());
      case '/nat_wind_speed':
        return MaterialPageRoute(builder: (_) => NatWindSpeed());
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
