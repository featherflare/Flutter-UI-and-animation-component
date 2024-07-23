import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier with ChangeNotifier {
  Map<Filter, bool> _filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  Map<Filter, bool> get filters => _filters;

  void setFilter(Filter filter, bool isActive) {
    _filters = {
      ..._filters,
      filter: isActive,
    };
    notifyListeners();
  }
}
