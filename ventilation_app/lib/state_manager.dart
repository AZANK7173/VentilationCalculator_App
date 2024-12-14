import 'package:flutter/material.dart';

class CalculationState with ChangeNotifier {
  //3-input_1
  Map<String, bool> _settingOfInterest = {
    'Residential/Comercial': true,
    'Hospital Setting': false
  };

  String _lenght = '0';
  String _height = '0';
  String _width = '0';

  Map<String, bool> _unitLeght = {'meters': true, 'inches': false};

  Map<String, bool> _unitHeight = {'meters': true, 'inches': false};

  Map<String, bool> _unitWidth = {'meters': true, 'inches': false};

  Map<String, bool> _ventType = {'nat': true, 'mec': false};

  Map<String, bool> get settingOfInterest => _settingOfInterest;
  String get lenght => _lenght;
  String get height => _height;
  String get width => _width;
  Map<String, bool> get unitLeght => _unitLeght;
  Map<String, bool> get unitHeight => _unitHeight;
  Map<String, bool> get unitWidth => _unitWidth;
  Map<String, bool> get ventType => _ventType;

  void updateSetOfInterest(bool res) {
    _settingOfInterest['Residential/Comercial'] = res;
    _settingOfInterest['Hospital Setting'] = !res;
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
  String _ventrate2 = '0';
  String _ventrate3 = '0';
  String _ventrate4 = '0';

  String get ventrate => _ventrate;
  String get ventrate2 => _ventrate2;
  String get ventrate3 => _ventrate3;
  String get ventrate4 => _ventrate4;

  void updateVentRate(String w, Map unitW) {
    _ventrate = w;
    _unitVentRate = unitW.cast<String, bool>();
    notifyListeners();
  }

  void updateVentRate2(String w, Map unitW) {
    _ventrate2 = w;
    _unitVentRate2 = unitW.cast<String, bool>();
    notifyListeners();
  }

  void updateVentRate3(String w, Map unitW) {
    _ventrate3 = w;
    _unitVentRate3 = unitW.cast<String, bool>();
    notifyListeners();
  }

  void updateVentRate4(String w, Map unitW) {
    _ventrate4 = w;
    _unitVentRate4 = unitW.cast<String, bool>();
    notifyListeners();
  }

  Map<String, bool> _unitVentRate = {
    'l/s': true,
    'm³/s': false,
    'm³/h': false,
    'ACH': false,
    'CFM': false
  };

  Map<String, bool> _unitVentRate2 = {
    'l/s': true,
    'm³/s': false,
    'm³/h': false,
    'ACH': false,
    'CFM': false
  };

  Map<String, bool> _unitVentRate3 = {
    'l/s': true,
    'm³/s': false,
    'm³/h': false,
    'ACH': false,
    'CFM': false
  };

  Map<String, bool> _unitVentRate4 = {
    'l/s': true,
    'm³/s': false,
    'm³/h': false,
    'ACH': false,
    'CFM': false
  };

  Map<String, bool> get unitVentRate => _unitVentRate;
  Map<String, bool> get unitVentRate2 => _unitVentRate2;
  Map<String, bool> get unitVentRate3 => _unitVentRate3;
  Map<String, bool> get unitVentRate4 => _unitVentRate4;

  //4n-input_nat_2 - first window type
  String _openingsnum = '0';
  double _openpercentage = 0;
  bool _mosquitonet = false;

  bool get mosquitonets => _mosquitonet;
  String get openingsnum => _openingsnum;
  double get openpercentage => _openpercentage;

  void updateOpeningNum(String w) {
    _openingsnum = w;
    notifyListeners();
  }

  void updateOpeningPercentage(double p) {
    _openpercentage = p;
    notifyListeners();
  }

  void updateMosquitoNet(bool m) {
    _mosquitonet = m;
    notifyListeners();
  }

  String _windowheight = '0';
  String _windowwidth = '0';

  Map<String, bool> _unitWindowHeight = {'meters': false, 'inches': false};
  Map<String, bool> _unitWindowWidth = {'meters': false, 'inches': false};

  String get windowheight => _windowheight;
  String get windowwidth => _windowwidth;
  Map<String, bool> get unitWindowHeight => _unitWindowHeight;
  Map<String, bool> get unitWindowWidth => _unitWindowWidth;

  void updateWindowDimensions(String h, String w, Map unitH, Map unitW) {
    _windowheight = h;
    _windowwidth = w;
    _unitWindowHeight = unitH.cast<String, bool>();
    _unitWindowWidth = unitW.cast<String, bool>();
    notifyListeners();
  }

  // 4n-input_nat_2 - other type of window

  String _openingsnum2 = '0';
  double _openpercentage2 = 0;
  bool _mosquitonet2 = false;

  bool get mosquitonets2 => _mosquitonet2;
  String get openingsnum2 => _openingsnum2;
  double get openpercentage2 => _openpercentage2;

  void updateOpeningNum2(String w) {
    _openingsnum2 = w;
    notifyListeners();
  }

  void updateOpeningPercentage2(double p) {
    _openpercentage2 = p;
    notifyListeners();
  }

  void updateMosquitoNet2(bool m) {
    _mosquitonet2 = m;
    notifyListeners();
  }

  String _windowheight2 = '0';
  String _windowwidth2 = '0';

  Map<String, bool> _unitWindowHeight2 = {'meters': false, 'inches': false};
  Map<String, bool> _unitWindowWidth2 = {'meters': false, 'inches': false};

  String get windowheight2 => _windowheight2;
  String get windowwidth2 => _windowwidth2;
  Map<String, bool> get unitWindowHeight2 => _unitWindowHeight2;
  Map<String, bool> get unitWindowWidth2 => _unitWindowWidth2;

  void updateWindowDimensions2(String h, String w, Map unitH, Map unitW) {
    _windowheight2 = h;
    _windowwidth2 = w;
    _unitWindowHeight2 = unitH.cast<String, bool>();
    _unitWindowWidth2 = unitW.cast<String, bool>();
    notifyListeners();
  }

  // 4n-input_nat_3 - Other side of the room

  String _openingsnum3 = '0';
  double _openpercentage3 = 0;

  String get openingsnum3 => _openingsnum3;
  double get openpercentage3 => _openpercentage3;

  void updateOpeningNum3(String w) {
    _openingsnum3 = w;
    notifyListeners();
  }

  void updateOpeningPercentage3(double p) {
    _openpercentage3 = p;
    notifyListeners();
  }

  String _windowheight3 = '0';
  String _windowwidth3 = '0';

  Map<String, bool> _unitWindowHeight3 = {'meters': false, 'inches': false};
  Map<String, bool> _unitWindowWidth3 = {'meters': false, 'inches': false};

  String get windowheight3 => _windowheight3;
  String get windowwidth3 => _windowwidth3;
  Map<String, bool> get unitWindowHeight3 => _unitWindowHeight3;
  Map<String, bool> get unitWindowWidth3 => _unitWindowWidth3;

  void updateWindowDimensions3(String h, String w, Map unitH, Map unitW) {
    _windowheight3 = h;
    _windowwidth3 = w;
    _unitWindowHeight3 = unitH.cast<String, bool>();
    _unitWindowWidth3 = unitW.cast<String, bool>();
    notifyListeners();
  }

  //5n-nat_wind_speed
  String _tempIn = '0';
  String _tempout = '0';
  String _windspeed = '0';
  Map<String, bool> _unitWindSpeed = {'m/s': false, 'km/h': false};
  Map<String, bool> _unitTempIn = {'C': false, 'F': false};
  Map<String, bool> _unitTempOut = {'C': false, 'F': false};

  String get tempIn => _tempIn;
  String get tempout => _tempout;
  String get windspeed => _windspeed;
  Map<String, bool> get unitWindSpeed => _unitWindSpeed;
  Map<String, bool> get unitTempIn => _unitTempIn;
  Map<String, bool> get unitTempOut => _unitTempOut;

  void updateWindSpeed(String w, Map unitW) {
    _windspeed = w;
    _unitWindSpeed = unitW.cast<String, bool>();
    notifyListeners();
  }

  void updateTempIn(String w, Map unitW) {
    _tempIn = w;
    _unitTempIn = unitW.cast<String, bool>();
    notifyListeners();
  }

  void updateTempOut(String w, Map unitW) {
    _tempout = w;
    _unitTempOut = unitW.cast<String, bool>();
    notifyListeners();
  }

  bool _sideofroom = false;
  bool get sideofroom => _sideofroom;

  void updateSideOfTheRoom(bool s) {
    _sideofroom = s;
    notifyListeners();
  }
}
