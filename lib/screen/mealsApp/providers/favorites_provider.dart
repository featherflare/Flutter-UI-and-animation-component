import 'package:flutter/material.dart';
import 'package:practice_ui/screen/mealsApp/models/meal.dart';

class FavoriteMeals with ChangeNotifier {
  List<Meal> _meals = [];

  List<Meal> get meals => _meals;
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = _meals.contains(meal);

    if (mealIsFavorite) {
      _meals = _meals.where((m) => m.id != meal.id).toList();
      notifyListeners();
      return false;
    } else {
      _meals = [..._meals, meal];
      notifyListeners();
      return true;
    }
  }
}
