import 'package:flutter/material.dart';

class CalculationState with ChangeNotifier {
  //3-input_1
  Map<String, bool> _settingOfInterest = {
    'residential': false,
    'hospital': false
  };

  String _lenght = '0';
  String _height = '0';
  String _width = '0';

  Map<String, bool> _unitLeght = {'meters': false, 'inches': false};

  Map<String, bool> _unitHeight = {'meters': false, 'inches': false};

  Map<String, bool> _unitWidth = {'meters': false, 'inches': false};

  Map<String, bool> _ventType = {'nat': false, 'mec': false};

  Map<String, bool> get settingOfInterest => _settingOfInterest;
  String get lenght => _lenght;
  String get height => _height;
  String get width => _width;
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
      String h, String l, String w, Map unitH, Map unitL, Map unitW) {
    _lenght = l;
    _height = h;
    _width = w;
    _unitLeght = unitL.cast<String, bool>();
    _unitHeight = unitH.cast<String, bool>();
    _unitWidth = unitW.cast<String, bool>();
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

  //4m-input_mec_2
  String _ventrate = '0';

  Map<String, bool> _unitVentRate = {
    'I/s': false,
    'm³/s': false,
    'm³/h': false,
    'ACH': false,
    'CFM': false
  };

  String get ventrate => _ventrate;
  Map<String, bool> get unitVentRate => _unitVentRate;

  void updateVentRate(String w, Map unitW) {
    _ventrate = w;
    _unitVentRate = unitW.cast<String, bool>();
    notifyListeners();
  }

  //4n-input_nat_2
  String _openingsnum = '0';

  String get openingsnum => _openingsnum;

  void updateOpeningNum(String w) {
    _openingsnum = w;
    notifyListeners();
  }
}
