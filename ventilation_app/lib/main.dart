import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilation_app/route_generator.dart';
import 'package:ventilation_app/state_manager.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculationState(), // Providing the state
      child: MaterialApp(
        title: 'Ventilation App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Initially display FirstPage
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
