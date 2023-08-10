import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  halal,
  glutenFree,
  vegan,
  vegetarian,
}

class FilterNotifierPovider extends StateNotifier<Map<Filter, bool>> {
  FilterNotifierPovider()
      : super({
          Filter.halal: false,
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilter(Filter filter, bool isActive) {
    {
      state = {
        ...state,
        filter: isActive,
      };
    }
  }
}

final filterProvider = StateNotifierProvider<FilterNotifierPovider, Map<Filter, bool>>((ref) {
  return FilterNotifierPovider();
});
