import 'package:flutter/material.dart';
class Elementprovider extends ChangeNotifier{
  bool _isDark =false;
  bool get isDark => _isDark;
  double _isSlider =.5;
  double get isSlider => _isSlider;
  toggleThem(){
   _isDark = !_isDark;
   notifyListeners();
  }
  changeOpacity(double val ){
   _isSlider =val;
   notifyListeners();
  }
}