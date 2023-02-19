import 'package:flutter/material.dart';
import 'package:mealsapp/models/dummy_data.dart';
import 'package:mealsapp/providers/meal.dart';

class UpdateData with ChangeNotifier {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> get items {
    return [..._availableMeals];
  }

  List<Meal> _favoriteMeals = [];
  List<Meal> get favorites {
    return [..._favoriteMeals];
  }

  void updateFavorite() {
    _availableMeals.where((element) {
      if (element.isFavorite) {
        bool isfound = _favoriteMeals.contains(element);
        if(!isfound) {
          _favoriteMeals.add(element);
        }
        return true;
      } else if (!element.isFavorite) {
        _favoriteMeals.removeWhere((element) => !element.isFavorite);
      }
      return false;
    }).toList();
    notifyListeners();
  }

  void setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}
