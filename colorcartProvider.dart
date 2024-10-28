import 'package:flutter/material.dart';

class  Colorcartprovider extends ChangeNotifier{
  List<Color> _cartColors = [];
  List<Color> _colors = [Colors.orange,
  Colors.blue,
 Colors.grey
  ,Colors.green
  ,Colors.black,
  Colors.red,
  Colors.pink];

  List<Color> get cartColors => _cartColors;
  List<Color> get colors => _colors;
  addColorsToCart(Color color){
    if(_cartColors.contains(color)){
        _cartColors.remove(color);
    }
    else{
      _cartColors.add(color);
    }
    notifyListeners();
  }
bool colorCartStatus(Color color)=> _cartColors.contains(color);  

}