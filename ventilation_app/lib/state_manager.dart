import 'package:flutter/material.dart';

class CalculationState with ChangeNotifier {
  //3-input_1
  Map<String, bool> _settingOfInterest = {
    'residential': false,
    'hospital': false
  };

  double _lenght = 0;
  double _height = 0;
  double _width = 0;

  Map<String, bool> _unitLeght = {'meters': false, 'inches': false};

  Map<String, bool> _unitHeight = {'meters': false, 'inches': false};

  Map<String, bool> _unitWidth = {'meters': false, 'inches': false};

  Map<String, bool> _ventType = {'nat': false, 'mec': false};

  Map<String, bool> get settingOfInterest => _settingOfInterest;
  double get lenght => _lenght;
  double get height => _height;
  double get width => _width;
  Map<String, bool> get unitLeght => _unitLeght;
  Map<String, bool> get unitHeight => _unitHeight;
  Map<String, bool> get unitWidth => _unitWidth;
  Map<String, bool> get ventType => _ventType;

  void updateSetOfInterest(bool res) {
    _settingOfInterest['residential'] = res;
    _settingOfInterest['hospital'] = !res;
    notifyListeners();
  }

  void updateRoomDimensions(
      double h, double l, double w, Map unitH, Map unitL, Map unitW) {
    notifyListeners();
  }

  void updateVentType(bool nat) {
    _ventType['nat'] = nat;
    _ventType['mec'] = !nat;
    notifyListeners();
  }

  //
  int _value1 = 0;
  bool _value2 = false;

  int get value1 => _value1;
  bool get value2 => _value2;

  // Method to update values
  void updateValues(int newValue1, bool newValue2) {
    _value1 = newValue1;
    _value2 = newValue2;
    notifyListeners(); // Notify all listeners about the change
  }
}
