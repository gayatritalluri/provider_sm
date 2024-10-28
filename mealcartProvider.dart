import 'package:flutter/material.dart';
import 'package:provider_sm/models/meals_model.dart';

class MealCartProvider extends ChangeNotifier {
  final List<Meal> _mealCart = [];

  List<Meal> get mealCart => _mealCart;

  void addMealsToCart(Meal meal) {
    if (_mealCart.contains(meal)) {
      _mealCart.remove(meal);
    } else {
      _mealCart.add(meal);
    }
    notifyListeners();
  }

  void removeMealFromCart(Meal meal) {
    if (_mealCart.contains(meal)) {
      _mealCart.remove(meal);
      notifyListeners();
    }
  }

  bool isMealInCart(Meal meal) => _mealCart.contains(meal);
}
